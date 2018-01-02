/datum/event/money_lotto
	var/winner_name = "John Smith"
	var/winner_sum = 0
	var/deposit_success = 0

/datum/event/money_lotto/start()
	winner_sum = pick(5000, 10000, 50000, 100000, 500000, 1000000, 1500000)
	if(all_money_accounts.len)
		var/datum/money_account/D = pick(all_money_accounts)
		winner_name = D.owner_name
		if(!D.suspended)
			D.money += winner_sum

			var/datum/transaction/T = new()
			T.target_name = "Tau Ceti Daily Grand Slam -Stellar- Lottery"
			T.purpose = "Winner!"
			T.amount = winner_sum
			T.date = current_date_string
			T.time = worldtime2text()
			T.source_terminal = "Biesel TCD Terminal #[rand(111,333)]"
			D.transaction_log.Add(T)

			deposit_success = 1

/datum/event/money_lotto/announce()
	var/author = "[current_map.company_name] Editor"
	var/channel = "Tau Ceti Daily"

	var/body = "Tau Ceti Daily wishes to congratulate <b>[winner_name]</b> for recieving the Tau Ceti Stellar Slam Lottery, and receiving the out of this world sum of [winner_sum] credits!"
	if(!deposit_success)
		body += "<br>Unfortunately, we were unable to verify the account details provided, so we were unable to transfer the money. Send a cheque containing the sum of 5000 credits to ND 'Stellar Slam' office on the Tau Ceti gateway containing updated details, and your winnings'll be re-sent within the month."

	news_network.SubmitArticle(body, author, channel, null, 1)