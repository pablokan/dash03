import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import plotly.express as px
import pandas as pd

# reading the database
def readDB():
    import pymysql
    db = pymysql.connect("161.35.103.252", "tecnored", "tecno2020$Red", "tecnoredDB" )
    cur = db.cursor()
    cur.execute("SELECT FOS, TAC, FOS/TAC, fech, dige_id FROM charDige")
    return cur.fetchall()
    db.close()

datos = readDB()

# instancia la app de Dash y mete estilos
external_stylesheets = ['bWLwgP.css']
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# construye el dataframe con Pandas 
df = pd.DataFrame.from_records(datos, columns=["FOS", "TAC", "FOS/TAC", "Fecha", "dige_id"])

# arma el layout
app.layout = html.Div([
    html.H1(children='Digestores', style={'textAlign': 'center'}),
    html.Div([
        html.Div([
            dcc.Dropdown(
                id='comboDigestores',
                options=[{'label': i, 'value': i} for i in ['Principal', 'Secundario']],
                value='Principal'
            )
        ],
        style={'width': '20%',  'margin': '0 auto'}),
    ]),
    html.Div([
    html.Div([
        dcc.Graph(id='g1'),
        dcc.Interval(
            id='interval-component',
            interval=1000, # in milliseconds
            n_intervals=0
        )],
        style={'width': '48%', 'display': 'inline-block'}
    ),
    html.Div(
        dcc.Graph(id='g2'),
        style={'width': '48%', 'float': 'right', 'display': 'inline-block'}
    ),
    html.Div(
        dcc.Graph(id='g3'),
    )
], className='row')
    
])

@app.callback(
        [Output('g1', 'figure'),
        Output('g2', 'figure'),
        Output('g3', 'figure')],
        [Input('comboDigestores', 'value'),
        Input('interval-component', 'n_intervals')]
        )
    
def update_figure(comboDigestores, interval_component):
    datos = readDB()
    df = pd.DataFrame.from_records(datos, columns=["FOS", "TAC", "FOS/TAC", "Fecha", "dige_id"])
    filDig = 1
    if comboDigestores == "Principal":
        filDig = 1
    elif comboDigestores == "Secundario":
        filDig = 2
    filtered_df = df[df.dige_id == filDig]
    fig1 = px.area(filtered_df, x="Fecha", y="FOS", color_discrete_sequence=["yellow"])
    fig2 = px.area(filtered_df, x="Fecha", y="TAC", color_discrete_sequence=["blue"])
    fig3 = px.area(filtered_df, x="Fecha", y="FOS/TAC", color_discrete_sequence=["green"])
    fig1.update_layout(transition_duration=500)
    fig2.update_layout(transition_duration=500)
    fig3.update_layout(transition_duration=500)
    return fig1, fig2, fig3

if __name__ == '__main__':
    app.run_server(debug=True)
