import pdb
from db.run_sql import run_sql
from models.selection import Selection
from repositories import item_repository as item_repo

def get_list_selection(list_id):
    sql_string = "SELECT l_i.* FROM list_items as l_i WHERE l_i.list_id = %s"
    values=[list_id]
    results = run_sql(sql_string, values)
    selection_list = []
    for row in results:
        item = item_repo.select(row['item_id'])
        selection = Selection(item, row['selected'])
        selection_list.append(selection)
    return selection_list

def get_list_selection_ordered(list_id,order):
    sql_string = "SELECT l_i.* FROM list_items as l_i WHERE l_i.list_id = %s"
    values=[list_id]
    results = run_sql(sql_string, values)
    selection_list = []
    for row in results:
        item = item_repo.select(row['item_id'])
        selection = Selection(item, row['selected'])
        selection_list.append(selection)
    if order==1:
        selection_list.sort(key=lambda x: x.item.category.id)
    elif order == 2:
        selection_list.sort(key= lambda x: x.item.name)
    else:
        selection_list.sort(key= lambda x: x.selected)
    return selection_list

def insert_item(list, item):
    # todo: check for dups first. Either here or where it's called
    sql_string = "INSERT INTO list_items (list_id, item_id, selected) \
                VALUES (%s, %s, False)"
    values = [list.id, item.id]
    run_sql(sql_string,values)

def remove_item(list_id, item_id):
    # should be sorted by not allowing dups, but you never know, right?
    # you might need to check count(*) first.
    sql_string = "DELETE FROM list_items WHERE list_id = %s AND item_id = %s"
    values = [list_id, item_id]
    run_sql(sql_string, values)

def get_selection(list_id, item_id):
    sql_string = "SELECT l_i.* FROM list_items as l_i WHERE l_i.list_id = %s and l_i.item_id = %s"
    values=[list_id, item_id]
    results = run_sql(sql_string, values)
    item = item_repo.select(item_id)
    selection = Selection(item, results[0]['selected'])
    return selection

def toggle_item_selected(list_id, item_id):
    # should be sorted by not allowing dups, but you never know, right?
    # you might need to check count(*) first.
    selection = get_selection(list_id, item_id)
    sql_string = "UPDATE list_items SET selected = %s WHERE list_id = %s AND item_id = %s"
    values = [not(selection.selected), list_id, item_id]
    run_sql(sql_string, values)