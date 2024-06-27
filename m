Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5419A28F
	for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719511631; cv=none; b=h5biYbMGCTiA7feD8sYGTEkXRcwMpXa8HXSkQLDORsI0izF3YVdXO0XTWBDLSd6oEA80Lwg++DRXQP00QEWHnk59x10O7NbKxEQLooqWVYHrPp+voLQ8BncOQ33jr7tHxErFphaj7VXD9wyqin5gbUXGilAvIt44JftyY+/++uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719511631; c=relaxed/simple;
	bh=EAiH5AcxDGizDsjRBCmIonmcVf1bNXt8AIH/QALB0Ns=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FKsJt1s44x2uWhO9YBoI3hLNQBpy9XZJB+P6sTt0t9PEBtQzuS+GPEpuGok1Kn1FTbmuJJmrPFjpii5XIn5krE77Nkv4xD9KzzFnnMEpvxkFiDSLEhnz9ovOnpr+DTyEI2+0btRd5S3EE4VJk0jGuPVB+wrod8vMo9KeQs62jIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HHD0ZlcQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HHD0ZlcQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-6e67742bee6so6272333a12.1
        for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719511630; x=1720116430; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly6j+LQp+Ou/MLEtOL32JfRKdC+LpNg62gKylauHIOE=;
        b=HHD0ZlcQxlzt8w/nfnAX7ewYtnNGFOAdCMTA4lBZDRzHHXky3+ndcg6AT8fBRx8A82
         /XGAwgpf7tM+Y22UPEHQN74MD1kuIZi3SRoVyiSbaIHfAY9MX5940sCoUElDYinF7WTf
         70UQMOT+ZV7Pr1lZ7DeT03nUJJribamfjd2CIz5/Ae4pVgN1eiQsnRYkRSLFhvT3xaQ4
         kgC8peT45vQE99kYMjfNnEVkLr1ixN1OLK0nOz3SA+ivICvVJHt69XMkbpgAbm74OVgb
         qeCYBfyWP+m7D5ueTtksCF+OZltznVvIhwEJdyv9iOZUkqt0cJhB0JPUcT+iG5TTisAV
         5zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719511630; x=1720116430;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly6j+LQp+Ou/MLEtOL32JfRKdC+LpNg62gKylauHIOE=;
        b=ApBrHJv25JDxb0xWtmPCFGrKz5zo+dH/j1IPeNWYV27sYBwPgODrDQ4QyQkRjw3yVO
         VcL2dbxxuzABCMcEtMpkXWx4GFpENmXRGcie8kX8D9CBMUs8SA01hur4aD9ZCv20w2Iq
         qdNU2CxuYeOz6DIAPm4eM39tfvNr41UkWSl3ofmYR9eZJWyb3aieVg0QujgxkzMlPwgC
         VYS1yyYuQPUyfYm4u4Ahm3otP2UXJt/kO8lYTSYsgS8hhtELTuG3nO7eNZY9xS7yjSN+
         kyCHnoNn7LbXsj3SrOUE6aqhmFQWvgTBkB9DL4WpeO/ILn1LM2EwEw3zh17hwPm2hi4K
         9I4A==
X-Forwarded-Encrypted: i=1; AJvYcCW/FufA0gE5TncchxoEIcqz/GcMqxQChhGwl7evTW1Qn6qNq3WJqnkBep8Q0tLdz0WRCr7R/SP831AWmmWNUYbQiiPY4O3fn821cA==
X-Gm-Message-State: AOJu0YycWb15ut0S2RotCWnrizRCY7eoiPya/H4P0x4OCf4cMB8yOraY
	lphcx7g0LO+2IiNHevvDHdyhsau8ij3iocC5T2ws1uhLROwQaGlGD+tsLGFPtCTAfufpfrVG5DZ
	uKg==
X-Google-Smtp-Source: AGHT+IGB7UmqG7gr2s7ZFzglQssq+22/a1ExsgepdyatAXjw/z8ykZWCdPSekWALd2u1nA+fi04auchOvYs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:591:b0:71a:e413:b0ef with SMTP id
 41be03b00d2f7-71b5a24f606mr39867a12.3.1719511628344; Thu, 27 Jun 2024
 11:07:08 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:07:06 -0700
In-Reply-To: <30988934-c325-64eb-a4b1-8f3e46b53a55@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-2-michael.roth@amd.com> <ZnwecZ5SZ8MrTRRT@google.com>
 <6sczq2nmoefcociyffssdtoav2zjtuenzmhybgdtqyyvk5zps6@nnkw2u74j7pu>
 <ZnxMSEVR_2NRKMRy@google.com> <fbzi5bals5rmva3efgdpnljsfzdbehg4akwli7b5io7kqs3ikw@qfpdpxfec7ks>
 <ZnxyAWmKIu680R_5@google.com> <87320ee5-8a66-6437-8c91-c6de1b7d80c1@amd.com>
 <Zn2GpHFZkXciuJOw@google.com> <30988934-c325-64eb-a4b1-8f3e46b53a55@amd.com>
Message-ID: <Zn2qSl2zAjCKAgSi@google.com>
Subject: Re: [PATCH v1 1/5] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 27, 2024, Tom Lendacky wrote:
> On 6/27/24 10:35, Sean Christopherson wrote:
> >> The page states are documented in the SNP API (Chapter 5, Page
> >> Management):
> > 
> > Heh, but then that section says:
> > 
> >   Pages in the Firmware state are owned by the firmware. Because the RMP.Immutable
> >                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^
> >   bit is set, the hypervisor cannot write to Firmware pages nor alter the RMP entry
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   with the RMPUPDATE instruction.
> > 
> > which to me very clearly suggests that the RMP.Immutable bit is what makes the
> > page read-only.
> > 
> > Can you ask^Wbribe someone to add a "Table 11. Page State Properties" or something?
> > E.g. to explicitly list out the read vs. write protections and the state of the
> > page's data (encrypted, integrity-protected, zeroed?, etc).  I've read through
> > all of "5.2 Page States" and genuinely have no clue as to what protections most
> > of the states have.
> 
> I'll get with the document owner and provide that feedback and see what we
> can do to remove some of the ambiguity and improve upon it.

Thanks!

> > Ah, never mind, I found "Table 15-39. RMP Memory Access Checks" in the APM.  FWIW,
> > that somewhat contradicts this blurb from the SNP ABI spec:
> > 
> >   The content of a Context page is encrypted and integrity protected so that the
> >   hypervisor cannot read or write to it.
> > 
> > I also find that statement confusing.  IIUC, the fact that the Context page is
> > encrypted and integrity protected doesn't actually have anything to do with the
> > host's ability to access the data.  The host _can_ read the data, but it will get
> > ciphertext.  But the host can't write the data because the page isn't HV-owned.
> > 
> > Actually, isn't the intregrity protected part wrong?  I thought one of the benefits
> 
> The RMP protection is what helps provide the integrity protection. So if a
> hypervisor tries to write to a non-hypervisor owned page, it will generate
> an RMP #PF. If the page can't be RMPUPDATEd (the immutable bit is set for
> the page in the RMP), then the page can't be written to by the hypervisor.

My confusion (ok, maybe it's more annoyance than true confusion) is that that
applies to _all_ non-hypervisor pages, not just Context pages.  Reading things
from a "the exception proves the rule" viewpoint, stating that Context pages are
encrypted and integrity protected strongly suggests that all other pages are NOT
encrypted and NOT integrity protected.
