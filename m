Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D143C7B4
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974555; cv=none; b=pfkdKpYYaNdF0IRN+paTEsRd5vGCQCrkfurp7G19pVLj2Z4T7BptZMzOydIgn0hRv5iRdTgC2ueukcRT6EVal2/96R9iFjI6mEKCzZDqFPOaowxZeJna0nlyc3pqlQTi6id3E6UMrDZxgqY+NICI5nrRKTwFyE58bOYrwb3VPT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974555; c=relaxed/simple;
	bh=RnzOzGFK1YB2l72myPyapEsUaP3t6NWRMrFrNJEQl10=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CItLZ9yjTHDBFnfWp5qX8xClplucGwXzy2Uh9kiam7qcLPTLSCHDJtF6YcjqZMxKTMo5ekoAkGA5PUcSlXhgqLIQmUL5pPN43btd4o2rREHdlx7tQwzkDhRRqxM5hUmZkAc4n+G38VZPeSgLcKdXDZ00qIaVeWTy2Miu26bAfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qkLz0wHF; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qkLz0wHF"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2305395a12.2
        for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786974550; x=1787579350; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v60n69Fh2rc5rSD04kHKtxhuZ7ZKSWjk5+HKb8IHNFo=;
        b=qkLz0wHFijCt7lzaTc00611nZvd2vsJpioKcsllYo7ISi9foBtQQb4b/fHU7y6SK5N
         LYStlAQmsxXjKSbOhTa5Z0MzbtJUohKX+4ug1bRDAh6jmHv2FSMFfFLCq8Bw+xZWxFM/
         PWlmXi8UltOV3JT6MOG8fQBInyH0VukArr/+RFK+waS7ElVY9OFYkCSl+2ZSRL4djaCn
         1OiOZw9uiA3ZUZChtondjxWgB6vv/eU13KIdkDUmErQQ+YD/1YlR1mmDIfvfKwZybynz
         qv7MbPubLnA9qiADE821rR6U5SbJkotOW3T8YuVRfZWayl5Z/j5RTLM3XXIajqecIyTw
         B99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974550; x=1787579350;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v60n69Fh2rc5rSD04kHKtxhuZ7ZKSWjk5+HKb8IHNFo=;
        b=nO6SLtRWDNipkAozHT+yyxi/JG9Cb1YyiH1oVLsWCTplM2pvbTyuYLJ/2xQYLKkolY
         vteriLxgGpYPuOOM0PgOYR+eLfNXwTT5aihmsbSI5jnlRO6GcMYSL04IpEO4ZrXTGsFT
         OyGG36lX/nKXZ5RpDR8k9sW/TSnu5Xw3rvtyJCQCk72+Of7EnemtC90Olv7D7V+9fKkD
         QlY/AiDELXFvol7vIRo5dJn3gSaOXQQ6ap6OzrNhGe6TGp/qHBKWqHRI2SfH/t1IGjBB
         gruE44z4Oxf2dC5OHKrxN4IVUx5kJ6wk6dmonK9pZYKkVw8g+J69WQ8Sy/zapyO01e6w
         3tmg==
X-Forwarded-Encrypted: i=1; AHgh+RoK/9p5mGomDFZAoE3C7uLcIwgpiFaN0PRuIMFWIRdC3MuZfDYD82idxl46Es8On7Yhlp9d0YZedZMN@lists.linux.dev
X-Gm-Message-State: AOJu0YxXQMYXmM03thPGDRIK+2ynhRYF2T3zPzLUphUbtGC1Sugl1PkY
	g7ixO7Q6gSGqbSLXGIH0KvtM0bhbIR+FxUvXbfcuJevlT88Qrodh339Q5217IBTOfdiTtYt/ldO
	laQl4RA==
X-Received: from pgbfe12.prod.google.com ([2002:a05:6a02:288c:b0:cbe:dff5:6872])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6194:b0:3cc:3d08:da3e
 with SMTP id adf61e73a8af0-3ccda405874mr474615637.2.1786974549957; Mon, 17
 Aug 2026 06:49:09 -0700 (PDT)
Date: Mon, 17 Aug 2026 06:49:09 -0700
In-Reply-To: <e7430468-be26-4f96-a185-a774783d04b6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com> <20260814161129.2177118-2-seanjc@google.com>
 <e7430468-be26-4f96-a185-a774783d04b6@linux.intel.com>
Message-ID: <aoMRVRYz4V_IRWDp@google.com>
Subject: Re: [PATCH 1/3] KVM: VMX: Move the shared "IRQs off" exit handler(s)
 to common code
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 17, 2026, Binbin Wu wrote:
> On 8/15/2026 12:11 AM, Sean Christopherson wrote:
> > Move vmx_handle_exit_irqoff() and its helpers to common.h / main.c to
> > capture that it's a common handler and to allow guarding against incorrectly
> > using to_vmx(), and to allow for
>                                    ^
> It appears to have been abruptly truncated here?

Ya, apparently I saw something shiny and forgot to get back to this.  In hindsight,
I probably should have spammed v2 right away given how egregious some of these
goofs were, it probably would have been a net positive.  Anyways, this is what I
ended up with for a full changelog:

  KVM: VMX: Move the shared "IRQs off" exit handler(s) to common code
  
  Move vmx_handle_exit_irqoff() and its helpers to common.h / main.c to
  capture that it's a common handler and to allow guarding against incorrectly
  using to_vmx().
  
  Opportunistically use a "vt" prefix instead of "vmx" to communicate that
  it's a shared handler.
  
  No functional change intended.

> > Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> > Cc: Binbin Wu <binbin.wu@linux.intel.com>
> > Cc: Kai Huang <kai.huang@intel.com>
> > Cc: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> [...]
> 
> > +
> > +static void vmx_handle_exit_irqoff(struct kvm_vcpu *vcpu)
> 
> Since it's moved to the common code, is it better to rename it
> to vt_handle_exit_irqoff()?

Yeah, Sashiko pointed out that I was being dense as well.
