#!/bin/bash

# ==============================
# AWS Resource Checker (Clean Output)
# ==============================

# Region (update if needed)
REGION="us-east-1"

echo "========================================="
echo "          AWS Resource Health Check"
echo "          Region: $REGION"
echo "========================================="

# Function to display resource section
check_resource() {
    local title=$1
    local cmd=$2

    echo ""
    echo "Checking $title..."
    result=$(eval $cmd)

    if [[ -z "$result" || "$result" == "None" ]]; then
        echo "No $title found."
    else
        echo "Found $title:"
        echo "$result"
    fi
}

# EC2 Instances
check_resource "EC2 Instances" \
"aws ec2 describe-instances --region $REGION \
--query \"Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]\" \
--output table"

# S3 Buckets
check_resource "S3 Buckets" \
"aws s3 ls"

# RDS Databases
check_resource "RDS Databases" \
"aws rds describe-db-instances --region $REGION \
--query \"DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,Engine,Endpoint.Address]\" \
--output table"

# Lambda Functions
check_resource "Lambda Functions" \
"aws lambda list-functions --region $REGION \
--query \"Functions[*].[FunctionName,Runtime,LastModified]\" \
--output table"

# EKS Clusters
check_resource "EKS Clusters" \
"aws eks list-clusters --region $REGION --output table"

# DynamoDB Tables
check_resource "DynamoDB Tables" \
"aws dynamodb list-tables --region $REGION --output table"

# IAM Users
check_resource "IAM Users" \
"aws iam list-users --query \"Users[*].[UserName,CreateDate]\" --output table"

# CloudFormation Stacks
check_resource "CloudFormation Stacks" \
"aws cloudformation describe-stacks --region $REGION \
--query \"Stacks[*].[StackName,StackStatus]\" \
--output table"

echo ""
echo "AWS Resource Check Completed."
