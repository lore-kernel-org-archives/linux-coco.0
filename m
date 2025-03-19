Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF6208969
	for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409120; cv=none; b=HzuYmLH0fY7/qZltpQvpyOe3/cfqjdmuG95IfMn0ja5cbyKZrHUtaaBP2xTOggemBgau+gQ+aivTdBiIjs8C3IQec3fp7J/J9w90FdYr4Z1fxjz8DuJ1MarKWkb/l+ZoJaltGPCbZr5KpiV5NId5PCsE2m4e9FdUfpsmOdFIqwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409120; c=relaxed/simple;
	bh=3GakaPM/fNBmOhK+mUjiHO4d+ydVnb0sTLFrJKNV8K0=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=fdh9SSobc2pnT+69Bu5EeQbNg9N/c4P9yFAR9D5Qx7HefF4TMq0Xy7TlYu3seFZa+N2QXXZm7w3NTI8w9ffIBhGuCg4kuLShBXogjd9DYyII2ox30sUbCaaLJogT0fZKHIpkmxv8iq1aWU1zkAj09kYQDOaH9OGSKO6e7fYuzD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bE2mYB62; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bE2mYB62"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso44373165e9.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742409116; x=1743013916; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC1bbHfnSvb6Q+8up429qqhy/dZDBpKEi/2dCevOpVE=;
        b=bE2mYB62Fx70tinn7iyZgYn7qy3o01Bo1yEWp3xT1Gk+UTA2BbJC+bi0tfi0BDjhpS
         wPEM4Jc794SUZk8evB6ep2zIno0kSCH7FV/a2ZP2XsO+aW4d2l/1VJTO/p9eN5Cz3x11
         xd/fBVo7ODdutzLhvwB2JEe+qlgw8q5xBZqjGFpjNn+8FepkqsXCdcfQbNRmJUkqZGyV
         AeZXN03+dwwU/umvOKYeh77QxEWDbPFLVR3EkndbphZ0AXZq9ctF2gYSEvLAlYm7t3UB
         LRtGDDYknaoSFmfATYn5YLjIqoCTXz0cUHw98k+bqacWI9AMhfEb2gCakTxrKCpwL6FM
         Z24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409116; x=1743013916;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UC1bbHfnSvb6Q+8up429qqhy/dZDBpKEi/2dCevOpVE=;
        b=mnEqDHfiOray5s+pYVT9ZhD1TfTSwQm1Q8j8qvLjsuylUmnAQjsIbBP4awBRWTwBw2
         FmL92SQrX7civkYPdz60Y/uh6EOwLnuR0hWD9Yv3m+au3eQC+UQB1E954tY5iMD1jfgT
         hQE2Ah2yT30zmdbj3oez3rVCFsg2Bq3BH2SFVfwumDndZCtlL8aHi8k8QbvkDqexLyyw
         sozXMApGOJBTOjed8/zGM34QmuLk5hFSlj1DOQM5vS2c4ChgV2UrMeYM/CuaUyOr70pV
         XBYVujNWopuBgpWbvP4Vj8kRcG2Z5KV5UuWrHrBal8m1KJDMCgjEeMSr1gFihcVu6hFY
         3E9w==
X-Gm-Message-State: AOJu0YzNV3n+Cjd5i1l2ngI/v7wGh9TSpZkXnuxSHcsR/tvWWusxK7K+
	v30xF3klmZYQI8a1Qr+nXToMxiVwEUTRYm3sPAHy02HvqSwYzhllh/8QOCShz3rRQSPjGDz17vQ
	o
X-Gm-Gg: ASbGncs1fHKhoAxANopAHf6Etmy8GRuXZUJVyNh43uJstU0fCx4QlmcmD7YK7Q/ffTG
	McuJujsL5r2u7KNaHLurTKIWVe8snpl40DVzLl2MQaYPI+/uXXc2akErM7uSHdhvNvjFeLArylb
	L/s62z23aVRHVTQRuKGwUJM7HP1QeCnX0qzVZSgvBURJrJCXumtl1bVlTHW5d+6uBmqpd1ymnQk
	XvbrzZOOQMTDBMIW4EO2kGA8k3tvcuEn8GILed0bIIwIRlsfUWl2U+y+aIk9xw7vc3TNZcsAskR
	y2RGCkKGw/cKjIp9xS1Jo0eTOZuckyEHceIrZrIZwi6Oxb2xuBXcFtDJoTwl6jecbBfTnUiLb+P
	GWQp75Xs=
X-Google-Smtp-Source: AGHT+IGKa4LCn1aooq1ArWlwX3uqwdtfevVAWkGlDQuoKg9a5WmRG5m8A/ftkrrtMWK2qkxJJVrc2w==
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr36998535e9.2.1742409116087;
        Wed, 19 Mar 2025 11:31:56 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaedsm22201938f8f.90.2025.03.19.11.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:31:55 -0700 (PDT)
Message-ID: <19663032-c976-41b3-be84-bb946175ad13@suse.com>
Date: Wed, 19 Mar 2025 20:31:54 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: [BUG] Sleeping function called in __cpa_process_fault
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

While playing with the memory encryption state under TDX I managed
to hit the following 2 warnings:

[  534.294565] BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321
[  534.299968] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 466, name: test
[  534.304346] preempt_count: 1, expected: 0
[  534.307131] RCU nest depth: 0, expected: 0
[  534.309895] 2 locks held by test/466:
[  534.309903]  #0: ffffffffb684b950 (mem_enc_lock){.+.+}-{4:4}, at: set_memory_decrypted+0x34/0x70
[  534.309957]  #1: ffffffffb684b998 (cpa_lock){+.+.}-{3:3}, at: __change_page_attr_set_clr+0x56/0xd0
[  534.309986] Preemption disabled at:
[  534.309989] [<0000000000000000>] 0x0
[  534.314658] CPU: 0 UID: 0 PID: 466 Comm: test Not tainted 6.14.0-rc5-default+ #28
[  534.314666] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
[  534.314670] Call Trace:
[  534.314673]  <TASK>
[  534.314677]  dump_stack_lvl+0x7c/0x90
[  534.314698]  __might_resched+0x19f/0x2b0
[  534.314722]  __alloc_frozen_pages_noprof+0x262/0x300
[  534.314744]  alloc_pages_mpol+0x48/0x120
[  534.314761]  alloc_pages_noprof+0x4c/0x90
[  534.314766]  get_zeroed_page_noprof+0x15/0x80
[  534.314778]  populate_pgd+0x3f/0x1f0
[  534.314796]  __change_page_attr_set_clr+0x61/0xd0
[  534.314810]  __set_memory_enc_pgtable+0x127/0x1d0
[  534.314834]  set_memory_decrypted+0x44/0x70
[  534.314846]  read_mem+0x63/0x240
[  534.314870]  vfs_read+0xd9/0x370
[  534.314888]  ? memory_lseek+0x46/0x80
[  534.314895]  ? __lock_release.isra.0+0x5e/0x170
[  534.314917]  ? memory_lseek+0x46/0x80
[  534.314925]  ? memory_lseek+0x46/0x80
[  534.314933]  ? lock_release+0x87/0x160
[  534.314947]  ksys_read+0x68/0xe0
[  534.314961]  do_syscall_64+0x64/0x140
[  534.314975]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  534.314989] RIP: 0033:0x7f1e70d111f2
[  534.314995] Code: c0 e9 c2 fe ff ff 50 48 8d 3d 8a c9 0a 00 e8 d5 1a 02 00 0f 1f 44 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 0f 05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 48 89 54 24
[  534.314999] RSP: 002b:00007ffcbaef2b48 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[  534.315006] RAX: ffffffffffffffda RBX: 0000562bc68c9330 RCX: 00007f1e70d111f2
[  534.315010] RDX: 0000000000000001 RSI: 00007ffcbaef2b53 RDI: 0000000000000003
[  534.315013] RBP: 00007ffcbaef2b60 R08: 0000000000000000 R09: 00007f1e70e18d60
[  534.315016] R10: 0000000000000000 R11: 0000000000000246 R12: 0000562bc68c9120
[  534.315019] R13: 00007ffcbaef2c50 R14: 0000000000000000 R15: 0000000000000000
[  534.315043]  </TASK>




[   22.628756] Call Trace:
[   22.628759]  <TASK>
[   22.628764]  dump_stack_lvl+0x7c/0x90
[   22.628783]  __might_resched+0x19f/0x2b0
[   22.628804]  __alloc_frozen_pages_noprof+0x262/0x300
[   22.628823]  alloc_pages_mpol+0x48/0x120
[   22.628835]  alloc_pages_noprof+0x4c/0x90
[   22.628840]  get_zeroed_page_noprof+0x15/0x80
[   22.628849]  populate_pud+0x293/0x310
[   22.628863]  populate_pgd+0x9c/0x1f0
[   22.628876]  __change_page_attr_set_clr+0x61/0xd0
[   22.628888]  __set_memory_enc_pgtable+0x127/0x1d0
[   22.628909]  set_memory_decrypted+0x44/0x70
[   22.628919]  read_mem+0x63/0x240
[   22.628940]  vfs_read+0xd9/0x370
[   22.628949]  ? memory_lseek+0x46/0x80
[   22.628955]  ? __lock_release.isra.0+0x5e/0x170
[   22.628969]  ? memory_lseek+0x46/0x80
[   22.628975]  ? memory_lseek+0x46/0x80
[   22.628981]  ? lock_release+0x87/0x160
[   22.628994]  ksys_read+0x68/0xe0
[   22.629005]  do_syscall_64+0x64/0x140
[   22.629016]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   22.629025] RIP: 0033:0x7ffb898ab1f2


The problem is that __change_page_attr->__cpa_process_fault->populate_pgd may allocate memory with GFP_KERNEL but is called under cpa_lock. Switching the get_zeroed_page calls in the last function to GFP_ATOMIC and also in alloc_pmd_page/alloc_pte_age does shut up the warning but Dave considered this just sweeping the issue under the rug. His suggestion was to preallocate the worst case, but taking care of the pmd level can become hairy. So any suggestion are welcomed.
