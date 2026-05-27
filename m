Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E435FF5B
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909273; cv=pass; b=oY+Tt8iFrtlKDnOlCXiKCW+wPPHz5LQ2BJ6NwKJ4r9/qGVULq4521FfwstHXT+3GYIp0Dryj5tC8uvdLdWCoTKjn0JUNCm/7qp1OqHx0hO4D6C4+jB85VwciW2pmm66tS5LQtZFqP8xPMuyc2z47ONMH/WyveV/3V6WbEjTKCt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909273; c=relaxed/simple;
	bh=cxuZgmmkPCwg+JKDsJkcwE8p/yMe7OmgUBBQEoRSZlg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm+ms35q8Dkfnl8MJiWWfYxAe0EsBlMDDrD07lMmlSmsZYMSpsnbKTQth80tKmonP36BklIl8flPyCE9DaWwS8f1iTvuvNeolQBehEwkChYy9cQc9hb+yJ9/XO3oMHiAZl2z1Oab3Nqf16trXt5vgbe068jjaV0ffhfL4zvHuS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cxMHNkfk; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cxMHNkfk"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363e78746eso7953006c88.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 12:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779909271; cv=none;
        d=google.com; s=arc-20240605;
        b=b48NYVYbV4Zn0ckVA/0aowZPTcWWzeGUBrpQYnHQfvnj/Je/iqjZFNyytiDtMovxyX
         aDZ0md/L/humFCQ44e89BV4BZ17t9JBPbpBrGSh2s1qcjtV3ZLI1JQq5/eKovLc8syLD
         WKsyOz2ivsexsjWfWyUxpc/Hww32sC/QRuE7UVtwTFJ+gUqqir3A0hPvYlsHla2LtWty
         IbsFCCF0GjAscnCIuHZJMouzFVxTiVQSUuprffNm+r5SilJT2UkPL/QhIB/p8Pr+YBrm
         Kr+oyp3cAdmXzGY2GDDIxdYxbLZVg9iRzQ6IeE9MfjrEh3AIhtBeUFrhTT2Cql+yrji5
         97og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=iKraDOkRUUv444/RRlQa6/+8h198diUf5YFK+z5gLHI=;
        fh=P2d3Wcb4YmwlOiE472Ln23ALar695naiwjhDf8tDuMY=;
        b=dbJm6Y1Il3LkoZvAr4wxj6yCA0hszItNWqlEAgAigOTz401zD7Qpc4IyOBJ/b5/dBc
         p0QiPp8WPjYgoZtfVwX4LXUMp1qOhd5ZC/Nf2WafgtJKTnBpZ4CxVEyc3Iq8PVuuzudq
         UCmWdYz/QV0V4yLIwUy04Bmh0P1pbAYvXmx+tu/Pu7AKPZdiZOPkg1ZwVpwlNzFVPY9U
         c2ej6oSb7CXG8QkCs9+SVCe5rDCGzGCMPZQy5/AV/f76z1vH3lmsqCzv6p3+9I5+rdD2
         KHYcF/uYhhu9oC4I4tP0TpirZb0sYlvyQY3I+gbTJNhS02joB0m/uWq3p0FQrDA5K946
         RmvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779909271; x=1780514071; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKraDOkRUUv444/RRlQa6/+8h198diUf5YFK+z5gLHI=;
        b=cxMHNkfkmOwDwrZCkxuCZvLIhs/4hTD9gAoudxXRA9CoNKfO5gMjitsNMbTa9weXGq
         2TNdyXPM9/CBO0SQmYsJempv2O4Aw1CTUXLrmPB78mUZjSbyARSe3rq00l2g2d4thSzG
         cv0Bgt3cUegVEEXq86IDJ13uj7NjQRxczJ7ZytjMKbS9YSjK8T9Wj21NRTkBjxIyCJjF
         2C9MLUmvIKIbxPw6eS1gNM2iO04AdcYbHKck1S4Qz5VDvdXsrzU3WdRD3GmUSoYNSAjq
         db/p8jsADNk4D518v+XAhqaK9HeUr77YwYdrvldtHzHGPqmI5RgSXq9TLRt33m2KxEBh
         7HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909271; x=1780514071;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKraDOkRUUv444/RRlQa6/+8h198diUf5YFK+z5gLHI=;
        b=DanXaDseO3lRo5fRsWHCqr1w0UkKqIMn69/wjwoxR+2ZrCLIN/kbVDe27sCcABmDRM
         IvNeCrYOnjMh3UGbEHVj6ddRdxdfmKbcAWkney6TwXmsNw5rFl2g09H6KJzpQrIwDQda
         bP9XsWXJbhlKdYPW7ZzfX/Wo0+3pCCFtgzyB1PiC8QBEQwB07cxYS89+Qcd4Q3Sd7lX1
         TeMcIhGY1p/Aqghu1C19yA511A8BvcG1Q0RxNPiOg2tBJ1uH3rr7kOzRfA5T/DVcEWyA
         YgpCqiYVyblIw7pjQRe8F6xZGNhbgfViA/etf9VJtU3Iff8uOVTO7bEqJKbh6vhcTLV+
         7gaw==
X-Forwarded-Encrypted: i=1; AFNElJ+7Jseo1A5WMYOM8pXOnqAtv6GgiSFLW6FJqBjAkFdaETEAwThkKJz8hY6idpuKW8mV66t5qoXZLUSe@lists.linux.dev
X-Gm-Message-State: AOJu0YxHNYer+23is5yw3U6fTXeSjd9sUoRNPOl9k1Unt87bgenaj1FH
	zZMavpo0Nn7X0+2+E0XBLVTYSINLDaSECBuxKGQ6PGn/DYj6n52LGDz52Bmnu8yz1ikYUH2UhXN
	Z9R7qy3TN/V6LkkBrnXpUwAPpgK9pqTbLd+qUjdbF
X-Gm-Gg: Acq92OHAY7tO5KoeMMu+CL3GV0gFn895i0EEJ0w8HVPpR5yLQYtrcXSuHcI8Znx7l3y
	nuRoqZCAfZyoPwMIwfG6qvqujsDrJ7iqszoNxDwpfNpC8AFk2+IkM+BoMDNWipuGUrWBMzI2LsE
	P1oFN0iHG2t1FbINm4VFxMZMKKpDdk4bW4rv4cfiA7td0YLpjMJzeB5Vj88Kz1x57yDdKIIjGTt
	i7N4PN60rurzXeGzpH4bwJ2mBzOpGaEuk3f6Zgu9bAmoj1DPS8b2e8zegEMDg0hsswDPU8E7H/u
	5NB+4PcHb65pJcrkc9Du/VSjvc/2dtvu2lc8YObg8eSZSDJaV8DUclDoUy7jF7awPHk3kzMptxH
	bfDeihunbiByWOw==
X-Received: by 2002:a05:7022:661f:b0:135:f2aa:46da with SMTP id
 a92af1059eb24-1365f812eefmr8782266c88.16.1779909270126; Wed, 27 May 2026
 12:14:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 12:14:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 12:14:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ahXOiy0dBSBOQli2@google.com>
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
 <20260522-fix-sev-gmem-post-populate-v2-5-3f196bfad5a1@google.com> <ahXOiy0dBSBOQli2@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 12:14:29 -0700
X-Gm-Features: AVHnY4Lko5ticX5UbdxxG3ZWqAWN_nu1jsv5zl3_u-kUQ6XAw4rxQCl5mitsqfs
Message-ID: <CAEvNRgEJ9ozQsVkubL55+ApJ9Z0H_nRS1uP+BTa6+agYLAyMcw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: SNP: Mark source page dirty in sev_gmem_post_populate
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, May 22, 2026, Ackerley Tng wrote:
>> Mark the folio as dirty after copying data into the source page in
>> sev_gmem_post_populate. After the memcpy, failing to mark the page dirty
>> can lead to the memory management subsystem discarding the changes if the
>> page is reclaimed or otherwise processed by the swap subsystem.
>>
>> Fixes: 2a62345b3052 ("KVM: guest_memfd: GUP source pages prior to populating guest memory")
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  arch/x86/kvm/svm/sev.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index dbf75326a40f4..1a361f08c7a3d 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -2395,6 +2395,7 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>>  		void *dst_vaddr = kmap_local_pfn(pfn);
>>
>>  		memcpy(src_vaddr, dst_vaddr, PAGE_SIZE);
>> +		folio_mark_dirty(page_folio(src_page));
>
> I'd rather use set_page_dirty().  I'll fixup when applying, unless someon objects.
>

I was looking for page, dirty but set_page_dirty() somehow escaped my
search. This works, thanks!

>>  		kunmap_local(dst_vaddr);
>>  		kunmap_local(src_vaddr);
>>
>> --
>> 2.54.0.794.g4f17f83d09-goog
>>
