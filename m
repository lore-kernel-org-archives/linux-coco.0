Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F062033FE0F
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320227; cv=none; b=iuH+nTMgIyEqJxa3ECX0Zm0YCEL7NuxjB5PV3/X5+LbfUwqCwjDucCYI0CSKbAH+vhjGZqt2pfENF4x53W+AGn2ymTuXtUCiY48Qf6glCfSDK0KG9P+xbK9v5bR6rO5QciMpBl7koqLIWqum1kKoBbqealEicJjYE/FVEg2K/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320227; c=relaxed/simple;
	bh=sFclBlGuLlklutyWalxOxdLRxtPJWxF7xb2dfh79PCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q9qW3TpZN3Qb4rzKoLac6BfGYu6D8Kws+14cKYD3+cHiik3av6VhtmiywmeLnkqV8ealhGcaxxn9+4MTWX5XKogNDtsbHWdub8n9rMDt/GKzc6/FxcGlU/iz4vZpEeOFPFK0aLsENS/IWd7r+WL0QGnqKVSeaeZdUzROC/viChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZjT+Qk9A; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZjT+Qk9A"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7f0d806f2so3834835ad.2
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782320225; x=1782925025; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=ZjT+Qk9A5Rv4MR+xp8Ub6AhfKb+baw73MSOoVxRMbKzRjqriU9sL1EjBGW/n8YNNhk
         XJ0IrbXadELWnEvWLj4KRfDRug4nw955hA7Bd1n0K3CCe8Ydjh7kugbkqZZyYV8R0hhg
         NdHqfN3qfw+WKRC5ZoRcWzB95Ib2GTGXDCUJ4RACPdaip0yacKuydzoJImyLhMTAOsu5
         jmGV9ds/nx09WNnVub+yfb54Hv5oIHuy8MlT5VAoHCjwUmsVYMWzs2Y4d7ZoIGSxz4JU
         lgoG6bo/FvrV34fx06LUltlcn/oVY9Lt9PCSA65YT983y1pArl33ZocqWEc9j3nvFJ5c
         lryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320225; x=1782925025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=DLSQeRzdvswSJ2HEug9+X5MSzov9vwHKOp1BdzfrLXJWNiqK2FJtyo5cXCJ+Iwliyq
         p75KPj0wsJnWP6HNz7DGsZS6tp4ygC9iBIezxY0okluIjsPxHsgA0sI4xhiP5/6wMq2Z
         83jeYCZrEJTKrqWehYUCobJcHDR4tXo3JaWCrLWIrOjF+WWlGndsd3YPB1OlpyGRNQRV
         p19hyqJ7fRnrNScIKS9P2fSrYom7w7AuZS1vd8ZvA4xHRKwAFRzu0PXilIhl67iRltg/
         qbdP/kmuRsumPcsMZLe0gVD4hPgbvb7h79s/WZQxSL5YPdpCUtf+v2aqgyV2YFBqE3L4
         yyLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/ftO8PKwknkQydXXDZTzfeK0bbpYJMOgk4LjHoTyZZKWJXcjTSL0xQdxuIYuNrPBQ+Nx+tIk5vOFf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj960WXH/9QecVVUi2NDY/wUW/bfd+Gn8fSiBz+kCOxEuJpTx/
	EcSd6qCKAMifpJnKhUwzD+SWLxxmK/0Tix5+tMxaCLqW7Uf1DHXC8AbQEquSl/B/wvs2SXN8r1Z
	RszvXiQ==
X-Received: from plpn21.prod.google.com ([2002:a17:902:9695:b0:2c6:b814:535b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fd47:b0:2c0:b081:84b1
 with SMTP id d9443c01a7336-2c7e1464d1amr26763135ad.10.1782320224855; Wed, 24
 Jun 2026 09:57:04 -0700 (PDT)
Date: Wed, 24 Jun 2026 09:57:04 -0700
In-Reply-To: <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Message-ID: <ajwMYCSrPlxg-Fok@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 18, 2026, Ackerley Tng wrote:
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. 

Under what circumstances does this happen, and what alternatives are there for
userspace to work around the issue?
