Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9A333745
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181087; cv=none; b=QVY3aWxQPtZCAy+kjhjyJVzvqpLKYY/1bli4pxMtA1dDLxgd+itlTVe8peC8RrKnWX+3w7cGQY4hkwNGe9DaK1OyCE72StSq5JAjOv59YfgIG+7QJiceWkTLwXgu3h88Dn4C31a11EKI5vQX+hUWxbqnhYdcCMU/+uA8ox+AVpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181087; c=relaxed/simple;
	bh=pDXF8QRt7ZGKEq0AdjebnFgpWu1BsXgK6gD+2dgsUZo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rz0Jt0I1EuGVzDYHd2HlkLPV2FGVIouth+BulIUUrOVGENjyx6FpGmGyqGnxBEr/nH6Yc4WTF8bBxBJFEjYto4TTCk/oo+o/rDfkCUAohAOgH/K2b6sVui/oZxZD2Vkg5/slTNv3eHrCj4EgZLhbasxSdRHbzwnWYDk7Ls3cgGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ez5RodqS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ez5RodqS"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2ed279eedso19542515ad.0
        for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776181086; x=1776785886; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTzayLah8spuwGg86ncm2630WsNZvV7i/NqWUT/CAWQ=;
        b=ez5RodqSzrn/JMkhm28v6S3c0YgEmY1d4CVzoyxHLoZVrYzci6pQeNzAJwrg1FC8h6
         aJNt1ZJh0tM755918zInlDd9hKaINXsnPjFKrxYkI9Eeu8ueRx6mQxR1PBon9fqkY0Fr
         HhhH/YQxT4viRoT5J5Xl3UZQIw1WPP8iYgm10Ee0JAK2Yat5sZmyW5fa8mNN5kyeoX5W
         SdaOb8zcTWHDp3pzuK2SzWCKcx5LBVPihLdPE+WZiZNHal2KfZKIKpY4tIDcIn8RKRof
         3XGKngaZ69bLWf9i6/4GJe7hqODoxSYjjSMBVSa0LZMyGS+z52duo8jzwLC9kvMiV3wW
         8dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776181086; x=1776785886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTzayLah8spuwGg86ncm2630WsNZvV7i/NqWUT/CAWQ=;
        b=ptcAjM7u8rdQfXVeuNbKqKPivJGMBw4DR5VvqHOfq/XQ46n6tmC/ce2eOsIlkm5qbV
         XHapp85tPJWVmI22OM5fbRk9ZY+SLeqpUKh3zItnMcUBDq9ERC/uHklA70BYGZeAefz9
         v9NPa9C49g75O/DF2ofrkpHgTufDEDE9KWJzpT5e7qo/xAVb95QOUKxmuS0S1WbW7vRH
         1DYo5rH5Oz6Vr6agwQVk0wKuqgkwyaRn+ON3m70Vfe//8sslyH8F7sZSidnE5/ChM2HQ
         02hPIc72kWo9g3IvsCFyOAsHJy2vWcq9FbuLFiRWZdFWz+Ks4L7WznrJiPrs2ra0mJzA
         GQsA==
X-Forwarded-Encrypted: i=1; AFNElJ/Kmi74b/WdBF9LXHceFESlm1SWbKkn2kQje6jl/pdlM4jHLQIGkEPlvJ4+/pq5UcKQg3sawoQh2Lbz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj7ZwBEx4OpaC+pFRRf+aHy4N78cIxTISVHv6tO/v4yjrb04T/
	e3Suvak6uZMpXlC5uPacM53S5F3Uazkwkqhc0pGUOevS0Dk1D9ccgJ+QLx/U5umi32cMkFWebDU
	fFyQxcA==
X-Received: from pjyd3.prod.google.com ([2002:a17:90a:dfc3:b0:35c:e6e:959])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1802:b0:35b:e566:15a6
 with SMTP id 98e67ed59e1d1-35e4286354bmr18000661a91.28.1776181085761; Tue, 14
 Apr 2026 08:38:05 -0700 (PDT)
Date: Tue, 14 Apr 2026 08:37:55 -0700
In-Reply-To: <87e767b6-0324-44e6-92cb-f933002dec43@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com> <20260409224236.2021562-2-seanjc@google.com>
 <20b82b65-b156-4a2c-8094-b86dccfb3025@intel.com> <87e767b6-0324-44e6-92cb-f933002dec43@intel.com>
Message-ID: <ad5fUya3W9BKO_iA@google.com>
Subject: Re: [PATCH v2 1/6] KVM: x86: Add dedicated storage for guest RIP
From: Sean Christopherson <seanjc@google.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 14, 2026, Chang S. Bae wrote:
> On 4/14/2026 5:31 AM, Xiaoyao Li wrote:
> > Even leave RIP in regs[], what is the problem by just allocating the
> > index 16-31 to R16-R31 and making RIP the index 32?
> 
> But why?
> 
> Even though the array isn't explicitly labeled as GPRs, that's effectively
> how it's being used, and RIP isn't part of that set.
> 
> I don't think there is any benefit of leaving it in regs[]. 

+1.  Chang's earlier argument that RIP isn't a proper GPR swayed me over, e.g. RIP
doesn't have an architectural index.

Keeping RIP in regs[] saves one line of code in arch/x86/include/asm/kvm_host.h,
at the cost of making the code less readable (IMO) and incorrectly suggesting that
RIP can be accessed like other regs[].
