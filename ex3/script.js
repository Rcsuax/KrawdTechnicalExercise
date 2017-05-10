var axios = require('axios')

function sanitizeJson(data) {
    for (var i = 0; i < data.length; i++) {
        if (!data[i].character1_slug && !data[i].character1_img) {
            data[i].character1_slug = "";
            data[i].character1_img = ""
        }

        if (!data[i].character2_slug && !data[i].character2_img) {
            data[i].character2_slug = "";
            data[i].character2_img = ""
        }

        if (!data[i].character3_slug && !data[i].character3_img) {
            data[i].character3_slug = "";
            data[i].character3_img = ""
        }

        if (!data[i].team1_slug && !data[i].team1_name) {
            data[i].team1_slug = "";
            data[i].team1_name = ""
        }

        for (var key in data[i] ) {
            if (data[i][key] == null) {
                data[i][key] = "";
            }
        }

    }
    return data;
}

function getPlayers() {
    return axios.get('https://poilonsranking.herokuapp.com/games/super-smash-bros-melee/participants.json')
        .then(function (response) {
            var playersJson = sanitizeJson(response.data);
            console.log('{ "players" :'+ JSON.stringify(playersJson) + '}');
        })
        .catch(function (error) {
          console.log(error);
        });
}

function run(){
    getPlayers();
}
run();
