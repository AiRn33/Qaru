function errors(){
    if(document.querySelector('#errorScript').value.length > 0){

        let error = document.querySelector('#errorScript').value;
        let errorArr = error.substring(1, error.length - 1).split(',');

        let html = '';

        for(let i = 0; i < errorArr.length; i++){
            if(i % 2 > 0){
                // field
                console.log(errorArr[i]);
                document.querySelector('#' + errorArr[i].trim() + 'Area').innerHTML += html;
                html = '';
            }else{
                // msg
                html += '<div class="input-group has-validation">';
                html += '<div class="form-floating is-invalid">';
                html += '</div>';
                html += '<div class="invalid-feedback">';
                html += '</div>';
                html += '<div class="invalid-feedback-common">';
                html += '&nbsp;&nbsp; ' + errorArr[i].trim();
                html += '</div></div>';
            }
        }
    }
}
