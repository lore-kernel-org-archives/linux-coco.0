Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65653B1BD
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 00:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782173785; cv=none; b=VNM9Cntc1urdXpllfr7xro1S0ZKLemYXndYfxOn/ESJvoW91GBgDy82T7FYNgKkMtYlVSTxmH6degdS11ek/8mWhMcsHqBIIBfCO4RvpyIIzxa5C8wnXUPH+1UMf7rH/wF5m/uRwd5CcGs3riG51mpIBlNfnZRK56TQvpsCKBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782173785; c=relaxed/simple;
	bh=qLskmc5gvD/9BaiuXAI/iFKmnqqzh0h9QIDjBTZ0PXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ioY7gkNbJ4EAdkKFqfJ6CIdhJjf2GTINNwDE6aId592/eCnXBdzY2mNsA8QYOvERhTp8pCp2q5LzvCQqP13yp7bmnGLqoeX5RMTPA8pnqIw+2W2Q6gCOnVdAaGpsE5SJ1JsJQ6rdyibklLVl0I3KFf+EkjkZwgQB69C0nXG4okY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZWZBt2R; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZWZBt2R"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c0b35fa876so50217075ad.1
        for <linux-coco@lists.linux.dev>; Mon, 22 Jun 2026 17:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782173784; x=1782778584; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ob/JScNjh/WWoydgNSe9txnAf4hRBZPGssYHA/PqDQI=;
        b=aZWZBt2RPgE66rbOws/bQ4Jto+RADVBfilcfKXPpiD/6BwFERXBBjEJtVVLaX5DAbC
         lxxf/8dErkC6mToGsiRRyFjS9GoSyocJVII5OED/fIbTHVFcRQrLKGQYqUmnu8/nvlx+
         ijAYJSSwb4U55N19xnf1qgByqSMJhT4PwXKq8qFAge+pECPx0L81dOZmP707hJ+Cj1BQ
         OIaSEzyWaAdkNmyh2f3feo3uwn4H4Dav4v4WWoO8TiTNDaryJCspv90a7c3AwPlKt9p3
         Agz5t8mlV1VkspYYUtIIZ1YFS1nyV+R6P/gAqtcmI/W03gB8X0tvrMfd++J/S8kuHfnP
         xKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782173784; x=1782778584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob/JScNjh/WWoydgNSe9txnAf4hRBZPGssYHA/PqDQI=;
        b=cB17lBK++IySfzF5aHg4Z6HvERIU7bW296g5G0Pk9Q5AIKIMWUwcFUv5fWzxY9Y+i7
         Y+jxE8sTqV9b6xXUiBISAut/Spikv1JTSaNUbWDxE6DQC2diytW3flZ/rZfliqACPSmH
         MM71pj8OPafxnte19YxHjwgiP7Pq3andjHNPrg7Gi7kO3RJHAirTgw9jHA1K01lVyBnj
         /qa9T/ob6gJCLEatg8VU8+HejsWI1w5huGpsCslL5E6tqfw/lks3GjqSY5Jln1KAqRVd
         Z0B6chd6RGwlVxYJ7AIPaJ/yHbJfLF3ndW17t2svkXosRFx4DMr9GoSJmcbOsKLZQG1v
         MlYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmaghKGrUI/nvUzoU+2WrAq2mUn8NuFunbNMfL2t2qST7JpAQPG1RM2JFjhrCPCM10/+XDG5mFF2oC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7+Hbs455N/xL8HyHA+6hhTFZrA0lllTvZSjrT/JbRXFJwSQLm
	CGTpzvF1ZZWkUK7T5oTReNWRJwcPKsJJ/vDtAQT7YuGTvM7wavum9dgkQiVplYW3QfQpv+JYxfg
	DxpyqXw==
X-Received: from plbkx8.prod.google.com ([2002:a17:902:f948:b0:2bd:106:8ad0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da90:b0:2c7:c3a8:560b
 with SMTP id d9443c01a7336-2c7c3b7a5femr16356295ad.18.1782173782987; Mon, 22
 Jun 2026 17:16:22 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:16:22 -0700
In-Reply-To: <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com> <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com>
Message-ID: <ajnQVkLvFl_lMuGB@google.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
From: Sean Christopherson <seanjc@google.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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

On Fri, Jun 19, 2026, Julian Braha wrote:
> Hi Ackerley,
> 
> On 6/19/26 01:31, Ackerley Tng via B4 Relay wrote:
> 
> >  config KVM_VM_MEMORY_ATTRIBUTES
> > -	bool
> > +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> > +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
> 
> Sorry for the style nitpick, but could you keep the type and prompt as
> the first attribute in the Kconfig option definition (like the other
> options do)?

No need to be sorry, I've no idea why I put the "depends" first.  I don't even
know if that qualifies as a nit :-)

Ackerley, if you can provide your SoB (for Fuad's feedback), I can fixup when
applying (assuming nothing else necessitates v9).
