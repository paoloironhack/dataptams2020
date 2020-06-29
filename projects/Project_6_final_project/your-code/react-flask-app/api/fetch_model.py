import urllib.request

print('Beginning file download with urllib2...')

url = 'XXX'
urllib.request.urlretrieve(url, 'recommender_model_s3.h5')