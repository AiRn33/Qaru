function errors(){
    if(document.querySelector('#errorScript').value.length > 0){

        let error = document.querySelector('#errorScript').value;
        let errorArr = error.substring(1, error.length - 1).split(',');

        let html = '';

        for(let i = 0; i < errorArr.length; i++){
            if(i % 2 > 0){
                // field
                document.querySelector('#' + errorArr[i].trim() + 'Area').innerHTML += html;
                html = '';
            }else{
                // msg
                html += '<div>';
                html += '<div class="input-group has-validation">';
                html += '<div class="form-floating is-invalid">';
                html += '</div>';
                html += '<div class="invalid-feedback">';
                html += '</div>';
                html += '<div class="invalid-feedback-common">';
                html += '&nbsp;&nbsp; ' + errorArr[i].trim();
                html += '</div></div></div>';
            }
        }
    }
}

function errorsImg(){
    if(document.querySelector('#errorScriptImg').value.length > 0){

        let error = document.querySelector('#errorScriptImg').value;
        let errorArr = error.substring(1, error.length - 1).split(',');
        let html = '';

        for(let i = 0; i < errorArr.length; i++){
            if(i % 2 > 0){
                // field
                document.querySelector('#' + errorArr[i].trim() + 'Area').innerHTML += html;
                html = '';
            }else{
                // msg
                html += '<div class="input-group has-validation">';
                html += '<div class="form-floating is-invalid">';
                html += '</div>';
                html += '<div class="invalid-feedback-common" style="margin-top: 10px;">';
                html += '&nbsp;&nbsp; ' + errorArr[i].trim();
                html += '</div></div>';
            }
        }
    }
}

function email_check( email ) {
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email));
}

function jwtCheck(){

    let accessToken = localStorage.getItem("accessToken");
    let refreshToken = localStorage.getItem("refreshToken");
    let Authorization = localStorage.getItem("Authorization");

    if(accessToken != null){
        $.ajax({
            type: "POST",
            headers: {
                "Content-Type": "application/json",
                "accessToken" : accessToken,
                "refreshToken" : refreshToken,
                "Authorization" : Authorization
            },
            url:"/dummy"
        });
    }
}