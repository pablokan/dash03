import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import plotly.express as px
import pandas as pd

def readDB():
    # reading the database
    import pymysql
    db = pymysql.connect("localhost", "root", "root", "tecnoredDB" )
    cur = db.cursor()
    cur.execute("SELECT FOS, TAC, fech, dige_id FROM charDige")
    return cur.fetchall()
datos = readDB()

#mete estilos
external_stylesheets = ['bWLwgP.css']
colors = {'backPaper': '#333333', 'backPlot': '#888888', 'text': '#7FDBFF'}

# instancia la app de Dash
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# construye el dataframe con Pandas 
df = pd.DataFrame.from_records(datos, columns=["FOS", "TAC", "Fecha", "dige_id"])

# arma el layout
app.layout = html.Div([ # nivel_1
    html.H1(children='Digestor', style={'textAlign': 'center'}),
    html.Div([ # nivel_2
        html.Div([ # nivel_3 - combo div
            dcc.Dropdown(
                id='comboDigestores',
                options=[{'label': i, 'value': i} for i in ['Principal', 'Secundario']],
                value='Principal'
            )
        ],
        style={'width': '48%', 'display': 'inline-block', 'className' : 'colors'}
        ), # fin combo div
        
        html.Div([ # nivel_3 - radio div
            dcc.RadioItems(
                id='radioFOSyTAC',
                options=[{'label': i, 'value': i} for i in ['FOS', 'TAC']],
                value='FOS',
                labelStyle={'display': 'inline-block'}
            )
        ],
        style={'width': '48%', 'float': 'right', 'display': 'inline-block'}
        ) # fin radio div
    ]), # fin nivel_2
    dcc.Graph(id='chartDige'),
]) # fin nivel_1

# 
@app.callback(
        Output('chartDige', 'figure'),[
        Input('radioFOSyTAC', 'value'),
        Input('comboDigestores', 'value')
        ])
    
def update_figure(radioFOSyTAC, comboDigestores):
    if comboDigestores == "Principal":
        filDig = 1
    elif comboDigestores == "Secundario":
        filDig = 2
    filtered_df = df[df.dige_id == filDig]

    if radioFOSyTAC == "FOS":
        tipo = "FOS"
    else:
        tipo = "TAC"

    fig = px.bar(filtered_df, x="Fecha", y=tipo, color=tipo, barmode="group", opacity=0.8)
    fig.update_layout(transition_duration=500, plot_bgcolor=colors['backPlot'], paper_bgcolor=colors['backPaper'],font_color=colors['text'])
    return fig


if __name__ == '__main__':
    app.run_server(debug=True)
