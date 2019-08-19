cache:
	mkdir -p cache
	wget -O cache/index.json https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/index.json
	wget -O cache/amazonec2-eu-west-1.json https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEC2/current/eu-west-1/index.json

clean:
	rm -rf cache
