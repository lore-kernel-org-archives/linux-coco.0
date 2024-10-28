Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA01CF2A3
	for <linux-coco@lists.linux.dev>; Mon, 28 Oct 2024 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730139625; cv=none; b=Tj7RAUNeyCv9GCLHTajUs23JWs14apHuepJq/wTEokpFzWDAZ8sssEoMKJn3nCEM4nq0/gOqc0r/6KtPifMR9Zqhcl3gpNz8QE0i2KpTFi4iR53yFVvWZzvljo6RRWUEPj6YyXxArcmtmywOXaT88cIrr2d29sAwuJ9ZN9RqEEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730139625; c=relaxed/simple;
	bh=lH79W0uMbqi4yKZO5aZMPWy4AfJYjDaphUfhMP+ya0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p7DJugjdgc2+VYgrdjyCsTJtetPhu08UBGcwqtngaWJ7wQ+nr9ID3KHsj7rAfKI5RO2hs+ec9D4gmAtjlbRz622iZRLcxGeihacxz/drxUHsocSCE8Wwl3qtU4VM3lX8cNNHWPCwOWfkywd3/se/orS3aWPFcKHGhXIokqlccDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2K/1xqr1; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2K/1xqr1"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so7593391276.2
        for <linux-coco@lists.linux.dev>; Mon, 28 Oct 2024 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730139623; x=1730744423; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJX4y1SwBFlqpYhxsuhY42rX3MFJuIm/9BwAllYm8WA=;
        b=2K/1xqr1++qxb90GwAZ5vEN8UZy3J8pdeW3Ktt5qT8DY/iB76WpevXYDYdcV/Pqh3F
         u814sRaB6LhxJHU+0HX7Q/AwuUPjlaKvNqc5BD0n4+fIc4qZABQoVUEqxnTkmDAQfuYL
         /VubVK7NwwatMm0Oxn5J2TCF+4h0Acl+NXo6vhrsEuiryzw0NbegJ5STNoBhJPRZSjhI
         6dbZKnKbip9zjZNgCUFaX9TQsHI6n9IGeuX/DCI2DxY3vaPNOj+l269K/JEv1VgmMmf0
         qJ8cBre4IzSwl6CTG6l61WYa2WnRCNwLRfEyhTW47BrCjzRtfU5EMQS23bYKeV/TjYV6
         ltSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730139623; x=1730744423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJX4y1SwBFlqpYhxsuhY42rX3MFJuIm/9BwAllYm8WA=;
        b=Djjxfyn7WU2p92PSQRCUAxIHPpdR8+Yvnbwm9J52oHkXmq/B+t62K2SWTXDXmvq89N
         ZQTY8Zp2mlgLeZXz6Tb8jBVGxubN9T5/cBgj6ehAsRvkwDWa+u3ixStwBgz9AO1alCUM
         BY7j0aILuFwlc0q5GQElliCKrXZzcNuJkIF/7phHKySuXqAeyTtQJmP13wh756cG6Kng
         3dpnfzfRyQeRGLZTPdC/pCakXRLB3yZuF1c3BkIZRRebOoIsC2fMCLbUZphRI52QuR+/
         XRS2eM5xnROr6nhYSe5XQn2Hd/iuns77OWTKqg2z1Sl6CMs4eke4gqvcoLxmHIBwA3c2
         NwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq6QF6bjvsHq+wf5vb7zv3vzbvZRkigP9DWJ0mZL9Taq8TA9lfih2S50khTlHXyq3jtQMHpW1nKE3Y@lists.linux.dev
X-Gm-Message-State: AOJu0YzTtdNamkYmBEPlx3OPT8cGg7svLd9b8NSsX7zyzZ4AyTf+ohah
	1nXljLil+wq62y8raxmVz8zEbb1MtqVUE/Vvg/BsgAhwNosg6NGsGP7rwiKnicXtmjj7In4/4Ub
	LJA==
X-Google-Smtp-Source: AGHT+IFXrnGi8zCOlqbG2xXq8xFgLUpq2KxOh8G6ohInFjQzOCfOhTsZHU2ciqujNv6S3Xkjq8hOwwr3c9g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:844e:0:b0:e30:b813:ca60 with SMTP id
 3f1490d57ef6-e30b813d0a8mr995276.1.1730139623094; Mon, 28 Oct 2024 11:20:23
 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:20:21 -0700
In-Reply-To: <CAAH4kHZ-9ajaLH8C1N2MKzFuBKjx+BVk9-t24xhyEL3AKEeMQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-5-michael.roth@amd.com> <ZnwkMyy1kgu0dFdv@google.com>
 <r3tffokfww4yaytdfunj5kfy2aqqcsxp7sm3ga7wdytgyb3vnz@pfmstnvtuyg2>
 <Zn8YM-s0TRUk-6T-@google.com> <r7wqzejwpcvmys6jx7qcio2r6wvxfiideniqmwv5tohbohnvzu@6stwuvmnrkpo>
 <f8dfeab2-e5f2-4df6-9406-0aff36afc08a@linux.intel.com> <CAAH4kHZ-9ajaLH8C1N2MKzFuBKjx+BVk9-t24xhyEL3AKEeMQQ@mail.gmail.com>
Message-ID: <Zx_V5SHwzDAl8ZQR@google.com>
Subject: Re: [PATCH v1 4/5] KVM: Introduce KVM_EXIT_COCO exit type
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	pbonzini@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, 
	pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Chao P Peng <chao.p.peng@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 13, 2024, Dionna Amalie Glaze wrote:
> We can extend the ccp driver to, on extended guest request, lock the
> command buffer, get the REPORTED_TCB, complete the request, unlock the
> command buffer, and return both the response and the REPORTED_TCB at
> the time of the request. 

Holding a lock across an exit to userspace seems wildly unsafe.

Can you explain the race that you are trying to close, with the exact "bad" sequence
of events laid out in chronological order, and an explanation of why the race can't
be sovled in userspace?  I read through your previous comment[*] (which I assume
is the race you want to close?), but I couldn't quite piece together exactly what's
broken.

[*] https://lore.kernel.org/all/CAAH4kHb03Una2kcvyC3W=1ZfANBWF_7a7zsSmWhr_r9g3rCDZw@mail.gmail.com
