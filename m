Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE630DEB8
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311922; cv=pass; b=KE23jtbT0emBqA7Ve4agriuLy+RGuGBW0i3B90a4YkrCZ+2AOrDHKb6N9I9rZx3CP7tD24c9IMGDO6yZq8jEhtRW/fEUyP5jeAK+8nxEqreffTbo5nhs8nNmdp3y/hROTe69AoElxiDKOV3QKxc0Q0L5GffPx8wFRu2aTQ28ic4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311922; c=relaxed/simple;
	bh=+a1qMWWmOM6Y8/o1eN1lz2qoObcQIVgbkHxFmUvd4Kc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiD/9Llv4ePg+5AHwwtaU8DLTSuogMH2qpl+9nLmGWWJEZBHa6muHHXTMvmjIJCwLilNHLm0C8nDiShfZ+SYtzbutKAoWn+WEA/eUGPMTRijpH6Wepc7CJkiTjOpLzZHQK1UpBn9Ns8CPUhAmjnIswyjYbm0CmHKLPstsfKI7oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cuargue+; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cuargue+"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137335bc3caso1833271c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 07:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782311920; cv=none;
        d=google.com; s=arc-20240605;
        b=i+0g3nCQhp7thenhQAeeNwkbe8pt7seEBCJ8iw8mkp+O29iABoLCy58lkcgndMyE73
         4ruWjR1Mk1zlNRHW9l9U4TfZNlgDT5DsmN5O3LxY5gTg/ZyVhMrYrT7/wb4GghrbTMmg
         rktDR81KrCyTDOATWXukBVc2Yk/iTZVEBhFpb13bv08bSp9uivr2lXCOehz3vZuowpvM
         mLtrPakD1bhOyQ340GVBCftsvQCg480yTkyfrMnduBQGUErhochbX5qhE8d1Uat4mUgs
         Ew5BqeiDGzfb5RPZbRP8VHqcYgYv5tbBr/358zdNwJsawY1zqpE66kGrXL3idNlrMH82
         G0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        fh=qVzattSMJLoiruyQjtFaocfk7xxixctzV3ROM7TPiA4=;
        b=E0p7RLM+ULtQwjh+g98vzQreHK7T4zPs/wCAGUtOJRZ+gOGItOBB0noHSg9dJ5Dlti
         NaMjJya+2nkj7mmDyoRWCS/Xv2C2WYLi/e00O3x/N1Mf3HNlNWwUOpWxpST3muGvx/KP
         j2KOI51uK040zrIWPRSso0Ld3mRiGGngO3wR6IVsXKI2n/H7nJsKnRoZjyAG5K4jYF9F
         Ux8qyDD3dP0PuNTAy6doWX9RNUoRc6DKXf53Xw+HAbC5gyf12xh7rvy9Kgf/zhRRP52B
         YAflsYTFSegZA8Vrmbti4/4hhlqDMnJu099Kdtq3i1fwNkutltIIpCFdrYqXN3puYbbt
         7ZbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782311920; x=1782916720; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=Cuargue+sec3JGTIw2d0XvuxDjVxcwWtfiEEQrXEdeysndnckdhp5WOalX+pIvxB0I
         62Cv1dSnrqGYXRmmuVKOSseubr9b1EalRVNVts7scoyIKoWirN0rZ1WxXUxI4b2eqqma
         MRY6R4vXiH/xL2bAK0HnE6m9SLhyLbO1RSoV9Jbn8iSc2eGZdqayecK93/aTRDbTsdWm
         yfcv4tuOVI7Z5WHQ6mtKTDfQdqz2C9yiFceW6X8av59PJT5V1Z84iTeRuOYBBB3H3oMj
         yRlKqW1okvPvw7msBk/LJomZ/wGFCd0rRGnnN8KILQZ4DiZtq4IsHM3+DA1KpGE27KLW
         7K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311920; x=1782916720;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=kkGFNUy1EP99Ns77gVanvPiTBup39/UJM459gXSQhEQlNEGhkVatrNuSz7MtHXOlgA
         Y2PgHTrtkmLJJM7ER5BCEyB2OmpSh4cYCa2sCZZU/3tP0kgBdOkQJpjByiA1gxxw5DDW
         Y2JAK0F8l3tIYjFvegC2at1A89au4q0mVJcHubr7BJJIcaDOTYjUvOO+XqAohNtj1tIz
         ULE89Iu2fu7V0teAn4RcaycLTq+aTm09MA1Tc7w0AT3e/zCAyOsZL8VKViVLQ93k+9N/
         7+rXeVmp6+PspRpJFPYnBoSkQNQKMuaoz3XuWnH4aswvhqzJUBlMhg06wEuBbcjs5TMZ
         eKKA==
X-Forwarded-Encrypted: i=1; AFNElJ+WXt3Tv3XOyueZoqD9abybo0vllewdIxk3sUoOB/mCn94prLVUw/iGqMWlh+UyGew8SOKtCs0/VGzW@lists.linux.dev
X-Gm-Message-State: AOJu0YzBKJYsemaTvkthcRW9g740Nvmj5tiMoHisCR5pXKe/4cW0USsJ
	RtPwINXrAtYQhMsE7DcnXq5cUPhdigRShWMH3sXHmjwVJlt651xY47elzyywP/0odtVUCfOmoeU
	Q4BRg6X7Afwkd9t/cxMlI2EUFox9W6GIkI1FrBAz2
X-Gm-Gg: AfdE7cn2CBpaEMw/zbSA1jEzb11aXhp4wLgrHCFEAf/kJxLffMDrchBwAAWcHJ3xkOf
	HGHZ4XF6NBq0ceftQCj9vlfIHATbe9s0W6fY+CWew6YF+h52wlf7DCq+egUqVSgUXXJQjveROH2
	iE/DI3msgut7ym4odffkxURIU1SH5YxnY8R0clT/iBMfeNsa8Iass/c9o7743z0tFA3KUwY4Um8
	WNUXQOeqRb+iL/ZVfPB39/zBIkZdvscUMhas8S3aCDl794dihiHGBBSvxjzM3fiesG9J2lGqV7r
	rwJDfTa7HGI6NL1nCaf+P2T3k4qy
X-Received: by 2002:a05:7022:6612:b0:133:3bb1:8d40 with SMTP id
 a92af1059eb24-139d0c24496mr2539007c88.15.1782311919284; Wed, 24 Jun 2026
 07:38:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 07:38:38 -0700
X-Gm-Features: AVVi8CeozOwjsDHz095RESzI1L73Y_-_c-08wJAGuPOXvsS0FIpnjscm-5zrczA
Message-ID: <CAEvNRgG-WDzHp-15Mig4hiU5Dag0pFCu70-R-9b=PkD69W=ZMg@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> +	struct inode *inode;
>> +
>> +	/*
>> +	 * If this gfn has no associated memslot, there's no chance of the gfn
>> +	 * being backed by private memory, since guest_memfd must be used for
>> +	 * private memory,
>
> "guest_memfd must be used for private memory" is a bit confusing to me.
>

Hmm good point. Is the source of confusion that guest_memfd can be used
for both shared and private memory?

Perhaps this can be rephrased as:

guest_memfd is the only provider of private memory and guest_memfd must
be used with a memslot, hence if there's no associated memslot, there's
no chance of this gfn being private.

>> and guest_memfd must be associated with some memslot.
>> +	 */
>> +	if (!slot)
>> +		return 0;
>> +
>>
>> [...snip...]
>>
