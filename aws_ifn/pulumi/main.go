package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/ec2"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// Create an AWS resource (S3 Bucket)
		bucket, err := s3.NewBucketV2(ctx, "my-bucket", nil)
		if err != nil {
			return err
		}

		// Export the name of the bucket
		ctx.Export("bucketName", bucket.ID())
		return nil
	})

	//EC2 INSTANCE
	pulumi.Run((func(ctx *pulumi.Context) error {
		instance, err := ec2.NewInstance(ctx, "mywebserver-oneononeoneone", &ec2.InstanceArgs{
			InstanceType: pulumi.String("t2.micro"),
			Ami:          pulumi.String("ami-0c55b159cbfafe1f0"),
			Tags: pulumi.StringMap{
				"Name": pulumi.String("mywebserver"),
			},
		})

		if err != nil {
			return err
		}
		ctx.Export("publicIp", instance.PublicIp)
		return nil
	}))
}
