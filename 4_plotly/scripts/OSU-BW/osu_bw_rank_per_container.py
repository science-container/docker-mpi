import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
	    marker=dict(color=['#d62728','#d62728','#d62728','#d62728','#d62728']),
            x=['1 Rank','2 Ranks','4 Ranks','8 Ranks','16 Ranks'
            ],
            y=[18302.475,
		32262.034,
		22345.788,
		14218.05,
		31508.215
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="OSU Bandwidth- MPI Ranks per Container",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Ranks per Container',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title="Bandwidth (MB/s)",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[10000,35000]
                )           
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="osu_bw_ranks_per_container.pdf") 

