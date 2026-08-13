Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46273478E5E
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632218; cv=none; b=I/7sc5imO9Gk+kR8CSWfKaIFOls0AMwFqPDbKQOTS68N8QAFdd0hVk04d/PKU1pY2CxWdWbwGQWkab/wzSw67+apvacagrI0tvCoGJkzwoHqFcbq3U4csgNc8SxpACN0HHySjtmhAXSNjltZ1nyM0yR4X9BD+Y8Dly5IIryBQN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632218; c=relaxed/simple;
	bh=mWHX8G1vMtcvD4xBylDXDlohI1gXLpgdVH2pH08gA+Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xl0QSQA5NoYqc/FY32eEHMGW7ze6vjBYCZxesgI/DAd/+hMxpRxPEmf3KwGFMp7ENYYXz3g8jbLCdG+LoPU9Wq/baDnFl/4tlDeR6p3Na//kNAXXyTt18vNQa3Tp1s10SaJ5l/o8V0wqEx2AAJm6URqrCVKHPFgKGwwtiblx7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qgsxdeeq; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qgsxdeeq"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d004f13426so26082195ad.3
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786632216; x=1787237016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XtnzlHO9m29l9/hpBVjg+n0DEKeFZ76f2zo+ZLPVNMk=;
        b=qgsxdeeqOtUOkbryihxx7Y27F5/c7P2c/LtoCGv8qH1lhysB5AS7Hq4ySe7/NtjWOj
         8TSTJ2udh/prPVUUlRaV1kf5ASbndSbQHgaSq3UjmZnuYRVEPvATwPGVK9WI6FntEQWO
         9mtZ1tcU3kN2kBwU59XpAEFEUV6zzjrYxxjVBWb/RLRteOaKPkVpRWSE2wxp1RxaD2b8
         TINXoqOV3BcgB+Kv8GupE7kRTrnL0lkL1kHkyaPN6a3DlVfpynivAIf+uRcuBxwpCYRE
         nt4b5M1EEY3SaVvEx0zSG1D3I+aSRBe+XiGS6BF6JoOgCHtwN4nQo2G8+h0Z/nETRGh7
         lZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632216; x=1787237016;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtnzlHO9m29l9/hpBVjg+n0DEKeFZ76f2zo+ZLPVNMk=;
        b=YNcNzEYy9VxRxXtDskpHa/ZNZ/2ghJ0dMgXQ0r6/t7q/1KSufQ60mDTHhiEs1tFCE6
         JG+ZS4gQeqnnQOo/fWQATDuzqoukgNWErEMbVujT0js3kz2/6v9AbqhjJdmMyFYbtSmT
         C5ttiUUGz10Y2GFDrwaQra/FTLJ2m5wSLRjYY2R1MAsrlQJmYYswDFleaPAGsRNB+ucc
         vLbIm+UadWULJE1habYpwk2gjBxV7C3wcYfFKqFjvW+FWRhmETqJsmEE3IRy6iVkecLF
         3xgQ2BFuC7en6izQsMNG37JHNw6YacxnPsSZUdE0O4I9UjSes47A3NZ2FP4yz93FPbA0
         EUbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqk94RuM8LDOibwiq3MztHXW0RQv/cKeTllhfqHMkgGghkRIkqcGRztn39n1xwiXyyUufi0EQpaFq9X@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv5vvlPK17zfQtiI03M9lOYRlJkhWJt1koOOMy3ket7IoqFgXz
	tOjXmfTeaD571TZd8a2B05cxy5MPWnYha2iPSHiKIFy07DcvzebaLaRLLd231fM5Hg5FMkq3cpz
	tHvQlaQ==
X-Received: from plge13.prod.google.com ([2002:a17:902:cf4d:b0:2ca:f1f8:ea00])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:153:b0:2cf:b68a:2050
 with SMTP id d9443c01a7336-2d37e83cdbemr62702595ad.15.1786632215477; Thu, 13
 Aug 2026 07:43:35 -0700 (PDT)
Date: Thu, 13 Aug 2026 07:43:34 -0700
In-Reply-To: <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com> <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
 <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com>
Message-ID: <an3YFiDbjRs3PUwn@google.com>
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026, Xiaoyao Li wrote:
> On 8/13/2026 6:58 AM, Edgecombe, Rick P wrote:
> > On Wed, 2026-08-12 at 16:02 +0800, Xiaoyao Li wrote:
> > > -	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap)))
> > > +	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap))) =
{
> > > +		vt->exit_reason.bus_lock_detected =3D 0;
> > >  =C2=A0		return EXIT_FASTPATH_EXIT_HANDLED;
> > > +	}
> >=20
> > This still feels hacky to me. It at least deserves a comment I think. I=
f you
> > spin another version.
>=20
> I spent more time on this today and I find there is an existing issue. Wh=
en
> the previous Exit Reason is EXIT_REASON_EXTERNAL_INTERRUPT, the early ret=
urn
> here can go to the path due to the stale exit_reason.
>=20
> kvm_x86_call(handle_exit_irqoff)(vcpu)
>   vmx_handle_exit_irqoff()
>     handle_external_interrupt_irqoff()
>=20
> This makes the host process the external interrupt twice, and maybe more
> times if the wait_for_sept_zap remains longer.
>=20
> I think we need an separate fix to set
>=20
> 	vt->exit_reasons.full =3D TDX_INVALID_EXIT_REASON;
>=20
> so that if some patch is going to consume the stale Exit Reason, it can b=
e
> caught by TDX_INVALID_EXIT_REASON.

The more I look at this, the more I'm against shoving garbage into vt->exit=
_reasons.
With tdx_is_exit_reason_valid(), this is trivially easy to handle, *and* ex=
plicitly
captures the logic instead of subtly rerouting KVM away from meaningful han=
dling.

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 95d89d809c19..a1f5b5dc1fa3 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -157,6 +157,14 @@ static fastpath_t vt_vcpu_run(struct kvm_vcpu *vcpu, u=
64 run_flags)
        return vmx_vcpu_run(vcpu, run_flags);
 }
=20
+static void vt_handle_exit_irqoff(struct kvm_vcpu *vcpu)
+{
+       if (is_td_vcpu(vcpu) && !tdx_is_exit_reason_valid(vcpu))
+               return;
+
+       vmx_handle_exit_irqoff();
+}
+
 static int vt_handle_exit(struct kvm_vcpu *vcpu,
                          enum exit_fastpath_completion fastpath)
 {
@@ -1071,7 +1079,7 @@ struct kvm_x86_ops vt_x86_ops __initdata =3D {
        .load_mmu_pgd =3D vt_op(load_mmu_pgd),
=20
        .check_intercept =3D vmx_check_intercept,
-       .handle_exit_irqoff =3D vmx_handle_exit_irqoff,
+       .handle_exit_irqoff =3D vt_op(handle_exit_irqoff),
=20
        .update_cpu_dirty_logging =3D vt_op(update_cpu_dirty_logging),
