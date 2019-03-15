Highcharts.chart('question1', {

    chart: {
        type: 'boxplot'
    },

    title: {
        text: ''
    },

    legend: {
        enabled: false
    },

    xAxis: {
        categories: ['1st', '4th', '5th', '6th', '7th', '8th', '11th', '12th', '13th', '14th'],
        title: {
            text: 'March'
        }
    },

    yAxis: {
        title: {
            text: 'S&P 500 Close'
        }
    },

    series: [{
        name: 'Closing price',
        data: [
            [2760, 2801, 2848, 2895, 2965],
            [2733, 2853, 2939, 2980, 3080],
            [2714, 2762, 2817, 2870, 2918],
            [2724, 2802, 2806, 2871, 2950],
            [2654, 2836, 2864, 2882, 2910],
            [2714, 2762, 2817, 2870, 2918],
            [2714, 2762, 2817, 2870, 2918],
            [2714, 2762, 2837, 2890, 2928],
            [2714, 2762, 2817, 2870, 2918],
            [2724, 2802, 2806, 2871, 2950],
        ],
        tooltip: {
            headerFormat: '<em>CIO Survey for March {point.key}</em><br/>'
        }
    }, {
        name: 'Close',
        color: 'ff0000',
        type: 'scatter',
        data: [ // x, y positions where 0 is the first category
            [0, 2803.69],
            [1, 2792.81],
            [2, 2789.65],
            [3, 2771.45],
            [4, 2748.93],
            [5, 2743.07],
            [6, 2783.30],
            [7, 2791.52	],
            [8, 2810.92],
            [9, 2808.48	]

        ],
        marker: {
            fillColor: 'red',
        },
        tooltip: {
            pointFormat: 'Close: {point.y}'
        }
    }]

});

Highcharts.chart('question2', {

    chart: {
        type: 'boxplot'
    },

    title: {
        text: ''
    },

    legend: {
        enabled: false
    },

    xAxis: {
        categories: ['1st', '4th', '5th', '6th', '7th', '8th', '11th', '12th', '13th', '14th'],
        title: {
            text: 'March'
        }
    },

    yAxis: {
        title: {
            text: 'Oil Conviction'
        }
    },

    series: [{
        name: 'Conviction',
        data: [
            [-.8, -.2, 0, .8, 1.3],
            [-.8, -.2, .4, .9, 1.4],
            [-.7, -.4, .1, .6, 1.5],
            [-.6, -.3, .2, .5, 1.3],
            [-.8, -.1, .5, .7, 1.6],
            [-.5, 0, .3, .9, 1.2],
            [-.4, .2, .5, .8, 1.3],
            [-.1, 0, .5, 1.2, 2],
            [-0, .2, .6, 1.5, 1.7],
            [-.5, .3, 1, 1.4, 1.8],
        ],
        tooltip: {
            headerFormat: '<em>CIO Survey for March {point.key}</em><br/>'
        }
    }, {
        name: 'Close',
        color: 'ff0000',
        type: 'scatter',
        data: [ // x, y positions where 0 is the first category
            [0, -.1],
            [1, 0],
            [2, .1],
            [3, -0.05],
            [4, 0],
            [5, .2],
            [6, .3],
            [7, .3],
            [8, .8],
            [9, 1.1]

        ],
        marker: {
            fillColor: 'red',
        },
        tooltip: {
            pointFormat: 'Conviction: {point.y}'
        }
    }]

});

Highcharts.chart('question3uke', {

    chart: {
        type: 'column'
    },

    title: {
        text: ''
    },

    xAxis: {
        categories: ['1st', '4th', '5th', '6th', '7th', '8th', '11th', '12th', '13th', '14th'],
        title: {
            text: 'March'
        }
    },

    yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Percentage of Respondents'
        }
    },

    tooltip: {
        formatter: function () {
            return '<b>' + this.x + '</b><br/>' +
                this.series.name + ': ' + this.y + '<br/>' +
                'Total: ' + this.point.stackTotal;
        }
    },

    plotOptions: {
        column: {
            stacking: 'percent'
        }
    },

    series: [{
        name: 'UK Equities Short',
        data: [5, 3, 4, 7, 2, 5, 3, 4, 7, 2],
        stack: 'uke'
    }, {
        name: 'UK Equities Neutral',
        data: [4, 7, 2, 5, 3, 3, 4, 4, 2, 5],
        stack: 'uke'
    }, {
        name: 'UK Equities Long',
        data: [2, 5, 4, 7, 2, 5, 3, 2, 5],
        stack: 'uke'
    }]
});

Highcharts.chart('question3gbp', {

    chart: {
        type: 'column'
    },

    title: {
        text: ''
    },

    xAxis: {
        categories: ['1st', '4th', '5th', '6th', '7th', '8th', '11th', '12th', '13th', '14th'],
        title: {
            text: 'March'
        }
    },

    yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Percentage of Respondents'
        }
    },

    tooltip: {
        formatter: function () {
            return '<b>' + this.x + '</b><br/>' +
                this.series.name + ': ' + this.y + '<br/>' +
                'Total: ' + this.point.stackTotal;
        }
    },

    plotOptions: {
        column: {
            stacking: 'percent'
        }
    },

    series: [{
        name: 'GBP/USD Short',
        data: [4, 7, 2, 5, 3, 4, 4, 2, 5],
        stack: 'gbp'
    }, {
        name: 'GBP/USD Neutral',
        data: [3, 4, 4, 4, 7, 2, 5, 3, 2, 5],
        stack: 'gbp'
    }, {
        name: 'GBP/USD Long',
        data: [2, 5, 6, 2, 1, 4, 7, 2, 5, 3],
        stack: 'gbp'
    }]
});

Highcharts.chart('question3vix', {

    chart: {
        type: 'column'
    },

    title: {
        text: ''
    },

    xAxis: {
        categories: ['1st', '4th', '5th', '6th', '7th', '8th', '11th', '12th', '13th', '14th'],
        title: {
            text: 'March'
        }
    },

    yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Percentage of Respondents'
        }
    },

    tooltip: {
        formatter: function () {
            return '<b>' + this.x + '</b><br/>' +
                this.series.name + ': ' + this.y + '<br/>' +
                'Total: ' + this.point.stackTotal;
        }
    },

    plotOptions: {
        column: {
            stacking: 'percent'
        }
    },

    series: [
    {
        name: 'VIX Short',
        data: [4, 7, 2, 5, 3, 3, 4, 4, 2, 5],
        stack: 'vix'
    }, {
        name: 'VIX Neutral',
        data: [3, 4, 4, 4, 7, 2, 5, 3, 2, 5],
        stack: 'vix'
    }, {
        name: 'VIX Long',
        data: [2, 5, 6, 2, 1, 4, 7, 2, 5, 3],
        stack: 'vix'
    }]
});
