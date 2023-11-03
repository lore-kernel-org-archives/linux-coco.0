Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E761BDF6
	for <linux-coco@lists.linux.dev>; Fri,  3 Nov 2023 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="btC9ro5T";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kQYiL6DM"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90B151F45F;
	Fri,  3 Nov 2023 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1699025402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ndJlZNeRg8eKoYiLSU2ZDnHkOEBvKilrv71pM5TEHQ=;
	b=btC9ro5TApirS1T623+HZinf3RTH+Pr6sUlcv2WbzFkewFb2iP6H97tHserzzu7QeK3Qqk
	kjuyzEBNJ6Kd+/ZdjatxwSSgy6wzdOkj+YIZDGPFx/QoQq/TSgi3GZ9CJilOOOtIFMEHqR
	33UBZbma1qFK8dvb3xN3kDXMtdWhg/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1699025402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ndJlZNeRg8eKoYiLSU2ZDnHkOEBvKilrv71pM5TEHQ=;
	b=kQYiL6DMJFovIRAOGp9iw+gax6ypZhYnLXxhAnWdaYZtYb+JBN32JmpfGaeO8H0T7+OiR6
	IJsM0V9nmalFQSCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53EED1348C;
	Fri,  3 Nov 2023 15:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Dv9JE/oRRWU8LwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 03 Nov 2023 15:30:02 +0000
Message-ID: <30ff0335-3d9c-7d54-85d0-5898320f4e1f@suse.cz>
Date: Fri, 3 Nov 2023 16:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] efi/unaccepted: Fix off-by-one when checking for
 overlapping ranges
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>, linux-efi@vger.kernel.org
Cc: x86@kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, stable@kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231103151354.110636-1-michael.roth@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20231103151354.110636-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/23 16:13, Michael Roth wrote:
> When a task needs to accept memory it will scan the accepting_list
> to see if any ranges already being processed by other tasks overlap
> with its range. Due to an off-by-one in the range comparisons, a task
> might falsely determine that an overlapping range is being accepted,
> leading to an unnecessary delay before it begins processing the range.
> 
> Fix the off-by-one in the range comparison to prevent this and slightly
> improve performance.
> 
> Fixes: 50e782a86c98 ("efi/unaccepted: Fix soft lockups caused by parallel memory acceptance")
> Link: https://lore.kernel.org/linux-mm/20231101004523.vseyi5bezgfaht5i@amd.com/T/#me2eceb9906fcae5fe958b3fe88e41f920f8335b6
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>

More justification for introducing a common ranges_overlap() helper somewhere :)

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
> v2:
>  * Improve commit message terminology (Kirill)
> ---
>  drivers/firmware/efi/unaccepted_memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
> index 135278ddaf62..79fb687bb90f 100644
> --- a/drivers/firmware/efi/unaccepted_memory.c
> +++ b/drivers/firmware/efi/unaccepted_memory.c
> @@ -100,7 +100,7 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
>  	 * overlap on physical address level.
>  	 */
>  	list_for_each_entry(entry, &accepting_list, list) {
> -		if (entry->end < range.start)
> +		if (entry->end <= range.start)
>  			continue;
>  		if (entry->start >= range.end)
>  			continue;

