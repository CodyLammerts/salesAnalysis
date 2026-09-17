import pandas as pd

def clean_data(file_path):

    df = pd.read_csv(file_path)


    df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_').str.replace('/', '_').str.replace('-', '_')


    strColumns = df.select_dtypes(include = 'str').columns
    for col in strColumns:
        df[col] = df[col].str.strip()


    df['order_date'] = pd.to_datetime(df['order_date'])
    df['ship_date'] = pd.to_datetime(df['ship_date'])


    df = df.drop_duplicates()


    probCustIDs = ['HO-15230','HO-15231','HO-15232','HO-15233','HO-15234']
    replacementID = 'HO-15230'
    df.loc[df['customer_id'].isin(probCustIDs), 'customer_id'] = replacementID


    return df


df = clean_data('..\\data\\raw\\store_data.csv')
df.to_csv('..\\data\\clean\\clean_store_data.csv',index = False)
