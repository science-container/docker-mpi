import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
            x=['Bare metal',
                '1 Docker<br>container per<br> host using<br>host network<br>',
                '1 Docker<br>container per<br> host using<br>overlay network<br>',
		'Singularity<br>container<br>'
            ],
            y=[8287.578,	8283.294,	8275.754,	8286.378
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="OSU - MPI Execution Approaches",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Execution Methods',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title="Latency ("+u'\u03bc'+"s)",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[7500,8500]
                )
            
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="osu_approaches.pdf") 

