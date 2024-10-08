-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

select w_warehouse_name,w_warehouse_sk,i_item_sk,d_moy
     ,stddev_samp(inv_quantity_on_hand) stdev
from inventory
   ,item
   ,warehouse
   ,date_dim
where inv_item_sk = i_item_sk
  and inv_warehouse_sk = w_warehouse_sk
  and inv_date_sk = d_date_sk
  and d_year =2001
group by w_warehouse_name,w_warehouse_sk,i_item_sk,d_moy;