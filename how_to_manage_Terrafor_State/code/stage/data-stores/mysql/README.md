# mysql 

- You should not add the database_password in clear text or upload it

```bash
export TF_VAR_db_password="(YOUR_DB_PASSWORD)"
```

- don't forget the secrets will be allays stored on the state file that is the reason why we should be carefully how to store the state files
  