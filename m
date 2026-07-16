Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232313E2ABC
	for <linux-coco@lists.linux.dev>; Thu, 16 Jul 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222409; cv=pass; b=WCeyFbZkOB9OeD81tbVQen81T7z0iceSLvzXlLqU6U/ZGG5R5gEUxDFgV6jhbvLgTlYyhwdkKuiZHsS+H7NCE2+03gDEbvOhSEGGZbZt+pGEAvqFJGPSHlzmg9upSrphMhNAkejdfemtseslSodPcbnU5NPfTxLfSnoztD0WxSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222409; c=relaxed/simple;
	bh=WgNPTyzJP6h+/loXvXxBK9obj+cvdvHP8r+IDx+BJ1I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+DZ3NBVnh4ctuQa2TLWPDqqatMh52zoQDO2M8tNX/iTK/wVa7m8s8RkEN8+DFqSMB4iXhRsS+oiYbrlAIE9hI9ApeJQOxAqy3X372KPdvuqipEntgqQ1inNRC3U5XoIDDtr5cUwx421zoT+OXjtMQMvYh5x+GwQrrsUhPdUz6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOgTykjd; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOgTykjd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so31439385ad.3
        for <linux-coco@lists.linux.dev>; Thu, 16 Jul 2026 10:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784222407; cv=none;
        d=google.com; s=arc-20260327;
        b=RiQEPwG7xCsasvK8x5+GyuHDnNq9LHCjDoy34uCNEeJdxrkwqJu4wKL63pXlcaPuXN
         S7M1qlQ0C3WOF0uWYidDu80m0mLwNGQBKqH0p4kGINvcXCGmqu7zG/hm3iKJw91b8p0o
         SXazhP6RlOM2Wl9/d3JM3PUPSfqiY9BJREYFlo8m0POdjNXcnGALsCaH1aLQeKfoddT3
         VSEhEa27HWorRZET60Cr0aKV0/Wefcjt8bhRf4XmYNQDl4BTumz48NIO+INhw/+0/Wd+
         DNScT43F7tHLScgsYmM96q3xh/giArq8k0k0YzMXY1XCM4bKJG2MtxaEU7tdMK+BSBJz
         3BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        fh=fjT70CHKY/dMiX5hO3H1RA9ClLcPfmYURg9iUTYhSic=;
        b=o3lZKq2WuDJrP+gxLXptm1pN6V+2yLnr455pbewVz9X2XZgHnNrm5q2HObnbvgPBPn
         /htIZDP6Bz1c7ooiIMp1Gew3mgPtTndmEon1/DZ5Ab3UDHnmyh+5vucx67OrCUsKKn69
         m6CKqgma4uKOP/eQCg8wjKeUyma6yL0SzgD1Hj0f9TnZ1j+yDokRusUO1i0NinEByW36
         mfO8be9CGKrc/eeh4a/ztOB3k6GeoVnbaMjI8wmU/bPMa7W0FwSGn6cTq+xETbM1zvN+
         7XTvbEpXaSMU3yZy2OyXTV9jnjC1pZT8Vglz8n1Calp2TfhHPq39HjG+FzI2APUhJgNg
         Sy6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784222407; x=1784827207; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=QOgTykjdLeKxl9wRfWUpwsMSDas7D3ZJfxtdJ56PesVD3RxrZbOsvcpW+WpcTeyYNU
         YkH2hlliyNc985aLbDOG1ZiGEd8KJ2sQroUhkRUpI/1uDYE7ka8anTO2SN44NqccXb30
         5nwtQ2IjmvGsnpcmmi+NqK8/HZECsxbSWP1CnsPQ1YpzNSr7W/PD/aiNknLnVNhbP/o/
         RlzJ/7SfARQXwDekVnHEPnVVlR3kSzKsXniidmzTyIh027KiD8IxjKh4D1NU2tJb5Uxq
         m4eA+XFehZf/PBP2ufx1ArK6qXW3vs/AvJqONv1Bcc3zVFMD2iRia6TPoOwYm1HDkBhR
         zMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222407; x=1784827207;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=rMxWZxocD1FtxInZHkMQbxGtYo1xrjIpF1SxK4TDf9JsyQC/8Oqu2EFZMPSH5RU6nF
         zlmh31t3pk0UwE8azQ4+cEuLG7yr9SBh/BdBIbqzC+H9exdlNzj1NuAy+RfDQc6IrUlq
         MR3Nv/OWcDyJsAb8iA6OiZnFCAs2/HfWi0S3eTHDe8bWjR0X0nPVGB+VuS43B83WZTIK
         6BoCH6c2o4/t2/PKY6JfhseW2WCEew8P/6vvnhfCVdd4lx+CXKTVlV6ihRovOd90zpiu
         /CEOKfq3U7fN9yK8cIprjvVYRqn9kL71oZA8Pti8J+iR+3ZhDBGaaD1P/8AoiLXcXknK
         XcnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8hOET5BZSKxemr5Fm611G75elh04Cxq0jnwq5PTIXTjdK+O7/OZCuQpHKpXiXQeKdBx4Nce/9oud3@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7FJVvIt544pJCWp/rLgRqEfJzUkmTL+fFkM0B834ZoIwqWsG+
	gUIEtU2mV9uknUBPolqQPmE+HgjInei+mKI6TctEGwlTNlNwFrvV2/y4/bBbqSuyiCn+IDIBpv/
	K9sPZNTi1KwGRNC7HXYMygFZbH4vFnRn8gKrGkup8
X-Gm-Gg: AfdE7cmh9Z3suFo9pH72gTa13Q2byFU7nf66TD5fC/bQzLNQmrzwsS1+NfE69qt11hi
	cDUG/Cf9gZ62+hWlOG+/GE64BfC4MElJOoSEoWI5r7/wZG9QGVaQ0n5eTmqnmAgxo1y3USpVpzt
	pfrQvgWDQTTXfF53gv+0c4z7wmruVeQqidrA5GY2gAluAamv57xCUcKn47Nbvx8jJJN/7uhmvA8
	v+2Q9m+eOrd2ukZVBxzKDWxG7zFRV82Z545WhgB5Ir+Rqbavwv23QcgUec/rs8OwI7C7XnfoPjw
	cfYMvpYaD+VHve6qc6WBSWn7y6RqLXx31q1eV/BUoWqw58kO
X-Received: by 2002:a05:6a21:7482:b0:3bf:6c08:2b2d with SMTP id
 adf61e73a8af0-3c3a5e7a4fdmr21247637.53.1784222406715; Thu, 16 Jul 2026
 10:20:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
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
Date: Thu, 16 Jul 2026 10:20:05 -0700
X-Gm-Features: AUfX_mxBIq-fm92f37AIysrX2Jjvm6RrlF5jRh7Q3ctlrGsM_3yjDZToekOalgI
Message-ID: <CAEvNRgEjPA5pi1RqpQWgp_hH2HmSnGhWaNiXtVBJb_VVdKD7qg@mail.gmail.com>
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

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Introduce function for KVM to check the private/shared status of guest
>            ^
> Nit:       a
>  > memory at a given GFN.
>>

For v9, I added the "a" in the commit messsage body but retained
"Introduce function" in the header (save characters, and make it sound
like a headline).

>>
>> [...snip...]
>>
