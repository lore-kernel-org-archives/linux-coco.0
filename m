Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C322F777
	for <linux-coco@lists.linux.dev>; Wed, 21 May 2025 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747851563; cv=none; b=jwAlpKGqXOns10WRlKgW4t6Ww6pyLKcAoaGlaRVZsLR801OFJPRkjMT06D46mZIwAn6ZddUzhw/hyj+0VVIoaCUCvDx8ec2Ojfqhy3I8p+ry9Xy/zL2E3yrs64+pShVU0bPTZFjNj1KqzuIfwLXP9XH7LREvhENqizC6IpxOBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747851563; c=relaxed/simple;
	bh=hNOCCsT7WfpiM1b/accfoXI44kJhoT550SBK2E3F0tM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sge2ZYPxmbM4UKtxq+TJKV/tYXt/1n6O6P/yPPtq8/Vp0jHm+zehOEMDCJrYE3hyczU8QX8WUui6drqaT9hrOk0EQMzDy/eGjOi8qnYFHr6vSw+7wKJSPOqdFu9ZQZHhhsWM4znO983JUy3RK+ypM6iws84Uy5LKg9ajkpd3GOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJSNL0ap; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJSNL0ap"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23222fdb4f2so66189965ad.3
        for <linux-coco@lists.linux.dev>; Wed, 21 May 2025 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747851562; x=1748456362; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpmXi2p97nfKGtbYPsKrqYABLynLWTxDiX5+ukiqgG4=;
        b=dJSNL0apC53fxXowOrI9OUOz8vl/iVkIP5JiBg8YhCfw9Aejeu2wTZC0Ski+iKMhvv
         Pd1ejfvJllLKfkCYknmBHTtjHtzljE5jIPvTJhWuEPzx+UE5e4vjLGtIjtEAF92Qzg5X
         3Y80OWDbSUpOEcGxHdgAJXS6rJWc5Hx4GYKgPzzCCc28rWGaSUwwORQbzo1SM7BEHOsE
         prInpgUlR1jo57eFr3nS/Kv6VXQLpSRmxcQ2L82JXgw1UWyZtjiaDZqOjV1cQi/hkJH2
         IPrJMxk3k87l7KIlQ6R1Oajbb620+iLd0sfcL1q0/YWRCdgbJ+v+5JwkpLP4sNzYJ66f
         3G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747851562; x=1748456362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpmXi2p97nfKGtbYPsKrqYABLynLWTxDiX5+ukiqgG4=;
        b=opkhGmZnLa5mD4W1+VUs3Oz4tNie5tlkYNje9bpbV1Ar+khje47DC2KoBdSMWOggSp
         M38nzqWSRFAZySveYIBHyiFuwbxKawa8Nep9XSksUMpXr0aDkfRu1+BXdErEE1nOaS+L
         LT57rm8XD2+DMk1UWQ1tL0xMAiIZvn6CcrB3J0N0rXswjIsRZemC1h8iKPw6Gngjn9ko
         nMBl/EQvIQiSG4e6oP7pVR9H1T9Ist20QVW5XaY/P9UwL+apcVHspJQ4Oy3gWyi1h74U
         XdCTM4lZJJ9QW8mUqTqRNefv+ItrUJHD93A6UAx+gHD2ZhCbLOUGZs8ZqxFM1yAzqwcG
         QQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyELfqFz8VDLJVAUGYZfa7vPm+nG+rgrtrLRbVzzLK4erbcsCo/4ua3THBK5ve5bqFSbOQvMgO/l4E@lists.linux.dev
X-Gm-Message-State: AOJu0YwFWJPtpSl9/GeV47/xaR73uu5x8beCY5flAcOa4bwSzARicxC7
	K7oK/LI5ulFlUQLQG5ntPqu/nW9HXD9cnsN0mHxRcLSqDNBMY/IjkSKgSR44vyXtnJ9FfY3SY2u
	rueaPag==
X-Google-Smtp-Source: AGHT+IEVAnp3aJri/4G8yCbjAGvCZIIAYw69WH0s/hXr+QEcz+tLscv1MFZEYlYAAbnwEEtRsZruxVuyc5E=
X-Received: from plkv11.prod.google.com ([2002:a17:903:1a2b:b0:22e:17e6:898f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aec:b0:21f:1202:f2f5
 with SMTP id d9443c01a7336-231de351473mr239997055ad.8.1747851561301; Wed, 21
 May 2025 11:19:21 -0700 (PDT)
Date: Wed, 21 May 2025 11:19:19 -0700
In-Reply-To: <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
 <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Message-ID: <aC4ZJyRPpX6eLKsC@google.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 16, 2025, Dionna Amalie Glaze wrote:
> > > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
> > >
> > >       mutex_lock(&sev->guest_req_mutex);
> > >
> > > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> > > +             ret = 1;
> > > +             goto out_unlock;
> >
> > Can you (or anyone) explain what a well-behaved guest will do in in response to
> > BUSY?  And/or explain why KVM injecting an error into the guest is better than
> > exiting to userspace.
> 
> Ah, I missed this question. The guest is meant to back off and try again
> after waiting a bit.  This is the behavior added in
> https://lore.kernel.org/all/20230214164638.1189804-2-dionnaglaze@google.com/

Nice, it's already landed and considered legal VMM behavior.

> If KVM returns to userspace with an exit type that the guest request was
> throttled, then what is user space supposed to do with that?

The userspace exit doesn't have to notify userspace that the guest was throttled,
e.g. KVM could exit on _every_ request and let userspace do its own throttling.

I have no idea whether or not that's sane/useful, which is why I'm asking.  The
cover letter, changelog, and documentation are all painfully sparse with respect
to explaining why *this* uAPI is the right uAPI.

> It could wait a bit before trying KVM_RUN again, but with the enlightened
> method, the guest could at least work on other kernel tasks while it waits
> for its turn to get an attestation report.

Nothing prevents KVM from providing userspace a way to communicate VMM_ERR_BUSY,
e.g. as done for KVM_EXIT_SNP_REQ_CERTS:

https://lore.kernel.org/all/20250428195113.392303-2-michael.roth@amd.com

> Perhaps this is me not understanding the preferred KVM way of doing things.

The only real preference at play is to not end up with uAPI and ABI that doesn't
fit "everyone's" needs.  It's impossible to fully future-proof KVM's ABI, but we
can at least perform due diligence to ensure we didn't simply pick the the path
of least resistance.

The bar gets lowered a tiny bit if we go with a module param (which I think we
should do), but I'd still like an explanation of why a fairly simple ratelimiting
mechanism is the best overall approach.
