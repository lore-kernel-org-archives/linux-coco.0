Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1066E2E7F25
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763751543; cv=none; b=f6GetvwJ6fmjNtn5fXNjYFkdaiIJClE1q0TZK9IXO9KoBWbI+MkeD4zDsJSAU7cdfeuecD3TmaNbuknAZvIQKq1cSrKBuZeKAyn8VTz7y2Qd8C4TbyEn88uvkPUhjx5DJIWZfPUJ1/PtfGusoakVQrSc1m2cN1uOKFL2BRBHxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763751543; c=relaxed/simple;
	bh=SU9bNEdaDKh7mOM+mVSGarP0ZpJC5sbY8V/e3Pee0U0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tI3/n9KfQh7WPUZ43LS8KU/Q70N6CxMe/GrkOTwc4ZHnHmkxJzMY2wvtDNKE0n+xQr/XWhFPI4PftHJ1BWlREhteWsJBZ79WDUvyTe0ndmI3zn1fHMWMgHURqc5H1a++w9eUIj6S4ZZSvn5InZpXCHFZDXHOMkt4iPsmYbx2980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IesDldeQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IesDldeQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so3889612a91.3
        for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763751540; x=1764356340; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=//TKb8hymvAxEf/QRG4A4e2YWKP48bUzqXRB3PNbsfE=;
        b=IesDldeQ9b4JMSLP664Wreg1iEfe1hZICdNCgzWqkMNXQpoA4aCjuxojUGnuge70MU
         kxLX6Hh7cNv7ePayK8L2+f1qE7QMjHvT4LXUKyLyCoFMhukqfd+TnJwi+cwW2/rK6uRo
         ejezdyz9c0OF38E9/TwFVUpZG64nkfLqeFyKj6wEGuFSJH/RAw7R4GAS2UlBc7i9A4Vw
         NafSKwNu9mlnUWA3OhVyo2HOtrOY3HfQW5DFsb5tUqyGzeRV8RCnzlwd8xcuixKJTZtd
         Dav2xJdQeWyLZuSGCoV9lKGxKws2+AaBqeNtwSJlDE0BvD7n+P2gcNbg3x0cqJj3JTOY
         f2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763751540; x=1764356340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//TKb8hymvAxEf/QRG4A4e2YWKP48bUzqXRB3PNbsfE=;
        b=C6axyU/NOVVKfXtkdK/mbP3xhSwtgfOLTPcb7NqrZuoj6x6ZglyR6Odn0rjPVbm2rB
         JGVZPIK1v+bWYHLzawtrXHyTUpbS7fM7WS96C6XdxhBUgmLdU84dpNGgk7RF7DyQyis7
         SkWWJF0PMZ5zxuuJ8GfS4LERmXvpbj85W3luv1U3NI16P4YFm7lRpWpmC0F+gJU/DotS
         /ifTguizklte5y2Y93LIVx/JS20mVECDnyY1BZiSyYycEmGFL3zNxUniUTt5LFQ5vBOH
         iespQgUy7Lv+GeF3micEmFactMcnh4cjuhN20AjlDKkIuzrx7yLhmXY/mtjT25BKOT8n
         Un1w==
X-Forwarded-Encrypted: i=1; AJvYcCWw6uFMmG63GypDIHWMtEOdGFAlEwzF1Qt4nrDQ9JNJv/khAMtGo1q/HTQsITfpNR/pVu4la5lKD20y@lists.linux.dev
X-Gm-Message-State: AOJu0YxZkD52/rEqa9jA2gliypBhG6owpP6My78q9PqBUL0nmgxYUi1t
	cv1ZrfPO3VWBF1rVsmZIZBR6qRMEdhM5WxFFFRSCMYU+lfY3kH5SKKz+38lD9I+MqhqIKmdMiw6
	ycNOU6g==
X-Google-Smtp-Source: AGHT+IEBvBp8jh0vOplCCD1S1V2MlG3rW1W9lkVPvmTObu/2p/kVSWbhD330IykVz/Yn0SKN5rKC88D+4vs=
X-Received: from pjbgg24.prod.google.com ([2002:a17:90b:a18:b0:343:4a54:8435])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc8:b0:340:776d:f4ca
 with SMTP id 98e67ed59e1d1-34733f34cfamr4082112a91.26.1763751540452; Fri, 21
 Nov 2025 10:59:00 -0800 (PST)
Date: Fri, 21 Nov 2025 10:58:59 -0800
In-Reply-To: <9098c603-70c0-4a22-a27b-4917ec0601d9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251118222328.2265758-1-seanjc@google.com> <20251118222328.2265758-3-seanjc@google.com>
 <9098c603-70c0-4a22-a27b-4917ec0601d9@linux.intel.com>
Message-ID: <aSC2czXKanvvtcLJ@google.com>
Subject: Re: [PATCH v2 2/4] KVM: VMX: Handle #MCs on VM-Enter/TD-Enter outside
 of the fastpath
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Jon Kohler <jon@nutanix.com>, 
	Tony Lindgren <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 21, 2025, Binbin Wu wrote:
> On 11/19/2025 6:23 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index fdcc519348cd..f369c499b2c3 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -7062,10 +7062,19 @@ void vmx_handle_exit_irqoff(struct kvm_vcpu *vcpu)
> 
> I think the bug in v1 is because the fact that the function is the common path
> for both VMX and TDX is overlooked. Do you think it is worth a comment to
> tell the function is the common path for both VMX and TDX?

Probably not?  Addressing that quirk crossed my mind as well, but there are so
many dependencies and so much interaction between VMX and TDX code that I think
we just need get used to things and not assuming TDX is isolated.  I.e. trying
to add comments and/or tweak names will probably be a game of whack-a-mole, and
will likely cause confusion, e.g. due to some flows being commented and others
not.
