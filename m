Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4F3446C7
	for <linux-coco@lists.linux.dev>; Tue, 21 Oct 2025 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065196; cv=none; b=LhXZC4apOGf44ZIpfgzk/RcqKk/nNbwV6qzJ7PX71pLd9EZ7JR7731g2FEBye97e8+jZdLzCzlAVfGJoPERhgghiJ0u+fALCRcxY7QxYi31Ni+RdXLhj/ITFrXOWUwKU1i0fHBk5EeB7e/XSEYgkWWZVlR4bODDTaM3awNIOgGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065196; c=relaxed/simple;
	bh=MzCSlF7JPYH2kOHDFsTdRATR2yhvHJ8O9b6vUSpv794=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dpCtZIgu3V8c8DPB+YHOK4LoGesluG+fxQPmQ0Be0nebG4iNx3D7Vxfgm1ad9aA8rQlS/BOnHYW7vWRa8F+V/BXFfflFlqCr79lczpYYZlHI9jyZZZ17nByckU2O/HCDrsO9oTSPLm0oQuU/iQrMZgM4qrNJwJSu1mO0oWkAGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJkVDAUw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJkVDAUw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33bba464b08so5662792a91.0
        for <linux-coco@lists.linux.dev>; Tue, 21 Oct 2025 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761065194; x=1761669994; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILJtTbb3p1RSJdwFph32qlzFNqhYFB7y760KFco4Owo=;
        b=iJkVDAUwVe/VuR3+BuQOdQZ6aCVg4+xi8Hc3xX9PRBuPFE0JUd/NFpRFkD0wzRObgO
         Nj4S+9nlsSKg56z5VWQkpzRRNDGpg2Ary8/1TfhX3ZW7ahI/JD9lzzye2pnI9vFM3GaP
         vT81iX2rcLoW8Zcl1VfNfHkhto2ypCp5i50jmCjg58GE6ZXG/0xykGCPlMNa44uyba4j
         Moh7Eqrpd5Zd4iTxJ1dKoFx1kBOAQtsbiPeimrxdbYauNDVtjz2PE1Kr2hoJgnpsal63
         RC/2qCF7UeUZYnRC10FJ3ZXSkRE7d7E248qOmdB6cjuKhTjOE8YozT2369jFmly14V53
         Xzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065194; x=1761669994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILJtTbb3p1RSJdwFph32qlzFNqhYFB7y760KFco4Owo=;
        b=dnWpY5CYja1wBgkbkGGncFt6bZ/fbsj/rIgPnP7Yd/tCz3g7jN2cqcRHMD9KlNurQ/
         IJnVUpfSRx+YfKd4yjElazEx9Dk52P1T1Ubqpnn9isGaY0JHCC/CBaRMilUJjC4LzaHG
         XgwTWc+kcKqtPPUjNWC6MARmqJXZYxR4WQHyGnL4ACdzkEuuikz5Pm8H307rOL91bEFt
         Lbkhy84pmZEsapPEOMAwVbiwchKpOZ790tssOy18MgRAsKaF3cYVYrU37z7YD27jHPqU
         6aoEOW/ZjKw00HHpm+C+om54Ibf2SkWfPDPUc3zlCQhDxRt2yWA0OAGq0M1iBkKLaJ+o
         SvDg==
X-Forwarded-Encrypted: i=1; AJvYcCUKHpHBTNvmYhfCFaASyz7Uupg29G4/JH5U8XVLfvvVwMHm6X622AfVci6HfMiKmEMS+j8GGdsUuxvm@lists.linux.dev
X-Gm-Message-State: AOJu0YzFaj4wAMtuXypptyXE2JhGxp6BlaqC3OhuidycysDoU2HwZlrc
	kbcSSALtYZ8wjcgKKQsbnuNUTQLl9txCbE4yOMy6Af3Ze6Nrb064U1mMUcIt84skZsazarGXisH
	pNHRVpg==
X-Google-Smtp-Source: AGHT+IHQC8FnTeE31bDovIZahN02vzwA1aMcIa7ISNfuievKsucJKLKlotq+V3A/k5eE93pnT90GbMf/PEo=
X-Received: from pjbtd12.prod.google.com ([2002:a17:90b:544c:b0:330:b9e9:7acc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17cb:b0:32a:34d8:33d3
 with SMTP id 98e67ed59e1d1-33bcec1abbfmr19826042a91.0.1761065194119; Tue, 21
 Oct 2025 09:46:34 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:46:32 -0700
In-Reply-To: <4841c40b-47b0-4b1b-985f-d1a16cbe81fa@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251016222816.141523-1-seanjc@google.com> <20251016222816.141523-2-seanjc@google.com>
 <e16f198e6af0b03fb0f9cfcc5fd4e7a9047aeee1.camel@intel.com>
 <d1628f0e-bbe9-48b0-8881-ad451d4ce9c5@intel.com> <aPehbDzbMHZTEtMa@google.com>
 <4841c40b-47b0-4b1b-985f-d1a16cbe81fa@intel.com>
Message-ID: <aPe46Ev0wWks6Hz2@google.com>
Subject: Re: [PATCH v4 1/4] KVM: TDX: Synchronize user-return MSRs immediately
 after VP.ENTER
From: Sean Christopherson <seanjc@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kas@kernel.org" <kas@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, wenlong hou <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 21, 2025, Adrian Hunter wrote:
> On 21/10/2025 18:06, Sean Christopherson wrote:
> > On Tue, Oct 21, 2025, Adrian Hunter wrote:
> >> On 21/10/2025 01:55, Edgecombe, Rick P wrote:
> >>>> +	 * Several of KVM's user-return MSRs are clobbered by the TDX-Module if
> >>>> +	 * VP.ENTER succeeds, i.e. on TD-Exit.  Mark those MSRs as needing an
> >>>> +	 * update to synchronize the "current" value in KVM's cache with the
> >>>> +	 * value in hardware (loaded by the TDX-Module).
> >>>> +	 */
> >>>
> >>> I think we should be synchronizing only after a successful VP.ENTER with a real
> >>> TD exit, but today instead we synchronize after any attempt to VP.ENTER.
> > 
> > Well this is all completely @#($*#.  Looking at the TDX-Module source, if the
> > TDX-Module synthesizes an exit, e.g. because it suspects a zero-step attack, it
> > will signal a "normal" exit but not "restore" VMM state.
> > 
> >> If the MSR's do not get clobbered, does it matter whether or not they get
> >> restored.
> > 
> > It matters because KVM needs to know the actual value in hardware.  If KVM thinks
> > an MSR is 'X', but it's actually 'Y', then KVM could fail to write the correct
> > value into hardware when returning to userspace and/or when running a different
> > vCPU.
> 
> I don't quite follow:  if an MSR does not get clobbered, where does the
> incorrect value come from?

kvm_set_user_return_msr() elides the WRMSR if the current value in hardware matches
the new, desired value.  If KVM thinks the MSR is 'X', and KVM wants to set the MSR
to 'X', then KVM will skip the WRMSR and continue on with the wrong value.

Using MSR_TSC_AUX as an example, let's say the vCPU task is running on CPU1, and
that there's a non-TDX vCPU (with guest-side CPU=0) also scheduled on CPU1.  Before
VP.ENTER, MSR_TSC_AUX=user_return_msrs[slot].curr=1 (the host's CPU1 value).  After
a *failed* VP.ENTER, MSR_TSC_AUX will still be '1', but it's "curr" value in
user_return_msrs will be '0' due to kvm_user_return_msr_update_cache() incorrectly
thinking the TDX-Module clobbered the MSR to '0'

When KVM runs the non-TDX vCPU, which wants to run with MSR_TSC_AUX=0, then
kvm_set_user_return_msr() will see msrs->values[slot].curr==value==0 and not do
the WRMSR.  KVM will then run the non-TDX vCPU with MSR_TSC_AUX=1 and corrupt the
guest.
