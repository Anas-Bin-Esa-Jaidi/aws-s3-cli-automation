![AWS](https://img.shields.io/badge/AWS-S3-orange)
![Bash](https://img.shields.io/badge/Scripting-Bash-blue)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
![CLI](https://img.shields.io/badge/Tool-AWS%20CLI-blue)

# 🚀 AWS S3 Automation using Bash & AWS CLI

Automating AWS S3 bucket lifecycle operations using Bash scripting and AWS CLI for repeatable and efficient cloud management.

## 📌 Overview

This project demonstrates automation of AWS S3 operations using **Bash scripting** and **AWS CLI**. It performs the complete lifecycle of an S3 bucket including creation, file upload, verification, and cleanup.

## 🔄 Workflow

1. User executes Bash script  

2. AWS CLI authenticates using configured credentials  

3. S3 bucket is created with a unique name  

4. File is uploaded to the bucket  

5. Bucket contents are verified  

6. Resources are cleaned up (object + bucket deletion)

---

## 🧱 Project Structure

```
aws-s3-cli-automation/
│── script.sh
│── backup-with-name-change.sh
│── README.md
```

---

## 🔧 Prerequisites

* AWS Account
* AWS CLI installed
* Configured credentials using:

```
aws configure
```

> ⚠️ Note: Never expose your Access Key & Secret Key publicly.

---

## ⚙️ Script Functionality

The script performs the following steps:

1. Creates a uniquely named S3 bucket
2. Uploads a file to the bucket
3. Lists objects in the bucket
4. Deletes the file and bucket

---

## 🛠️ Script Code

```bash
#!/bin/bash

set -e

BUCKET_NAME="anas-cli-bucket-$(date +%s)"
FILE_NAME="backup-with-name-change.sh"

echo "[INFO] Starting AWS S3 Automation..."

if [ ! -f "$FILE_NAME" ]; then
  echo "[ERROR] File not found!"
  exit 1
fi

echo "[INFO] Creating Bucket..."
aws s3 mb s3://$BUCKET_NAME

echo "[INFO] Uploading File..."
aws s3 cp $FILE_NAME s3://$BUCKET_NAME/

echo "[INFO] Listing Bucket Objects..."
aws s3 ls s3://$BUCKET_NAME

echo "[INFO] Deleting Bucket (with contents)..."
aws s3 rb s3://$BUCKET_NAME --force

echo "[SUCCESS] Automation Completed 🚀"
```

---

## ▶️ How to Run

```
chmod +x script.sh
./script.sh
```

---

## 📸 Screenshots

* Script execution output
<img width="1919" height="1079" alt="Screenshot 2026-04-16 211410" src="https://github.com/user-attachments/assets/69422e21-513b-46f2-adb3-4faef9371d8c" />

* AWS CLI configuration (masked credentials)
<img width="1229" height="157" alt="Blur_Screenshot 2026-04-16 203502" src="https://github.com/user-attachments/assets/803c260d-e0d3-4bbf-8689-e49d44b65343" />

---

## 💡 Key Learnings

* Learned to automate cloud resource management using AWS CLI
* Implemented Bash scripting for repeatable infrastructure tasks
* Understood the importance of automation in DevOps workflows

---

## 🌍 Real-World Relevance

This project reflects how DevOps engineers automate cloud operations to reduce manual effort, improve consistency, and manage infrastructure efficiently. Similar automation scripts are commonly used in deployment pipelines and operational workflows.

## 🚀 Future Improvements

* Add input parameters (bucket name, file name)
* Integrate with CI/CD pipeline
* Add logging and error handling enhancements

---

## 🏁 Conclusion

This project showcases automation of AWS S3 operations using CLI and scripting, reflecting real-world DevOps practices.
