<script>
    window.localStorage.setItem('Authorization', 'Bearer ${accessToken}');
    window.localStorage.setItem('accessToken', '${accessToken}');
    window.localStorage.setItem('refreshToken', '${refreshToken}');
    location.href = '/';
</script>