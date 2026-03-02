Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7F4014A6
	for <linux-coco@lists.linux.dev>; Mon,  2 Mar 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464262; cv=none; b=FRUeS4bB0ix2drg3F35fHomyEyJ4J02awXhs6oMLpoxfOISCZaEVQ1gjDr/7op4cYLCIBaS8lBSKzyIt/+sbfWsWBLR6lE6RDus0U6yie0P9qa2WP/6R09NcjIi+yRPm6wa0lC2PH8j/+uxxjBiHNs8KPpUrtg48NQ7N4z66g6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464262; c=relaxed/simple;
	bh=Yve/BpFkzyt3lOXcoTJY/52szTrD/U3uOL7+WrHNHHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cDmA8MW8J+T4AxHXEHil9wNebVp4hjVTIn7Eao9i4Z+8SbWOPv7/biYsVNlbHA+DEoRdjFijcJNKNQEHQTJ/wQ16faLuyy9td6erzAbJL5UZi+35P7V0FSLp8HtRsy71nUADuSC/FB7mFilKlB3ml7N6eSEA/dsKtaToKnAUcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/734H4a; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/734H4a"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2adfb6df9d6so280084385ad.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Mar 2026 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772464261; x=1773069061; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fAXHam1k+WHPTbPZyih3X1AbQHxa90npC7npw0uHXbc=;
        b=Q/734H4a8kypcj/U6xStZ/k7TzweK+5aqem5JkG6dIKBGOM0iS16b2agPFvwUfhtv6
         uMNCzPbi3KBdeAlDRIOrmO7lA5Ll3r9JhJSjp2d+KfELDXx7ca1kWbpprKDVycuaa7zT
         K694L+TzGy4iT7TdlhNmgQxMoNf0FHmLSAvevB9PCV2taW/0kL3bJNrRqR9t89RVYJ5O
         lEBfjdx5b02/n6lseZaAMWEIARCTzj0VFbd8OmYjBqtACl34OF9nHN4cFBj1sonCa40l
         RT7MHf0hYTZkfi9mS7OY+8LPzoKCN/zhAZt/TgxLEZUo1hFy4gUJ91EIMFxNUwiRolff
         5Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464261; x=1773069061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fAXHam1k+WHPTbPZyih3X1AbQHxa90npC7npw0uHXbc=;
        b=vf9GTz/5PfawneVOsuy3GMuDhft2h0meVlfiyHeUfhYLozjsF5TeScLlHOnZTd2twQ
         zbXhNJexPRKE33IJ8GQxEahBxScUv2j53BDNXVTeTK79gH59NLwytW+nJlYLRnhLUB3P
         PVb8HY8IB3pimMzJoB7LR1fwsWSEGdKahk2jJASSQV1FdyzAWCOtgtMzHZIbH4OGcDcR
         2Kz0olDn8A6SS9G/iYbzHdHOwydAAUyvJSd4VxV/b93enAz9K1/9iUc7IQqWTmBHud2x
         MTUazZMYSTFqOJG+I3Rv4oS5w5myIIMn3RhQxbsM/pQWvfCJ878xqTP2WyisR5t9CXRa
         5fvg==
X-Forwarded-Encrypted: i=1; AJvYcCXgtJqM6E9VOyjNL+KF6Qz7z18OQdbGKGjVB2otzXvO/8O2slpvi6fApxPX+TID7tbRZM9xMDcsoHq1@lists.linux.dev
X-Gm-Message-State: AOJu0YwdhN+vGIx+qpnyY2A7O6EvI/AackX4yQsd1lCBWOSOzMHdyksl
	ENtYwAYmBRKpvFQL94KGOQb9uG3Vsic/kWEFDfop5PDf9pe69Whd++hdg8uhJNhS2VOBze+Dryv
	mOUAJmw==
X-Received: from plan2.prod.google.com ([2002:a17:903:4042:b0:2ae:499b:f9c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:228b:b0:2aa:fad8:7474
 with SMTP id d9443c01a7336-2ae2e4a6621mr147425615ad.33.1772464260610; Mon, 02
 Mar 2026 07:11:00 -0800 (PST)
Date: Mon, 2 Mar 2026 07:10:59 -0800
In-Reply-To: <20260228165506.GAaaMd6nQ56E7i5Cqg@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203222405.4065706-1-kim.phillips@amd.com>
 <20260203222405.4065706-3-kim.phillips@amd.com> <20260228165506.GAaaMd6nQ56E7i5Cqg@fat_crate.local>
Message-ID: <aaWog_UjW-M3412C@google.com>
Subject: Re: [PATCH v2 2/3] KVM: SEV: Add support for IBPB-on-Entry
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Kim Phillips <kim.phillips@amd.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Naveen Rao <naveen.rao@amd.com>, 
	David Kaplan <david.kaplan@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Feb 28, 2026, Borislav Petkov wrote:
> Sean, ack for the KVM bits and me taking them thru tip?

Ya, should be fine for this to go through tip.

> On Tue, Feb 03, 2026 at 04:24:04PM -0600, Kim Phillips wrote:
> > AMD EPYC 5th generation and above processors support IBPB-on-Entry
> > for SNP guests.  By invoking an Indirect Branch Prediction Barrier
> > (IBPB) on VMRUN, old indirect branch predictions are prevented
> > from influencing indirect branches within the guest.
> > 
> > SNP guests may choose to enable IBPB-on-Entry by setting
> > SEV_FEATURES bit 21 (IbpbOnEntry).
> > 
> > Host support for IBPB on Entry is indicated by CPUID
> > Fn8000_001F[IbpbOnEntry], bit 31.
> > 
> > If supported, indicate support for IBPB on Entry in
> > sev_supported_vmsa_features bit 23 (IbpbOnEntry).
> > 
> > For more info, refer to page 615, Section 15.36.17 "Side-Channel
> > Protection", AMD64 Architecture Programmer's Manual Volume 2: System
> > Programming Part 2, Pub. 24593 Rev. 3.42 - March 2024 (see Link).
> > 
> > Link: https://bugzilla.kernel.org/attachment.cgi?id=306250
> > Signed-off-by: Kim Phillips <kim.phillips@amd.com>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > ---

...

> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index ea515cf41168..8a6d25db0c00 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -3165,8 +3165,15 @@ void __init sev_hardware_setup(void)
> >  	    cpu_feature_enabled(X86_FEATURE_NO_NESTED_DATA_BP))
> >  		sev_supported_vmsa_features |= SVM_SEV_FEAT_DEBUG_SWAP;
> >  
> > -	if (sev_snp_enabled && tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
> > +	if (!sev_snp_enabled)
> > +		return;
> > +	/* the following feature bit checks are SNP specific */
> > +
> > +	if (tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
> >  		sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
> > +
> > +	if (cpu_feature_enabled(X86_FEATURE_IBPB_ON_ENTRY))
> > +		sev_supported_vmsa_features |= SVM_SEV_FEAT_IBPB_ON_ENTRY;
> >  }

I think I'd prefer to nest the if-statement, e.g.

	if (sev_snp_enabled) {
		if (tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
			sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;

		if (cpu_feature_enabled(X86_FEATURE_IBPB_ON_ENTRY))
			sev_supported_vmsa_features |= SVM_SEV_FEAT_IBPB_ON_ENTRY;
	}

I'm mildly concerned that'll we'll overlook the early return and unintentionally
bury common code in the SNP-section tail.

More importantly, this patch is buggy.  __sev_guest_init() needs to disallow
setting SVM_SEV_FEAT_IBPB_ON_ENTRY for non-SNP guests.

As a follow-up, I also think we should advertise SVM_SEV_FEAT_SNP_ACTIVE and
allow userspace to set the flag in kvm_sev_init.flags.  KVM still needs to set
the flag for backwards compatibility, but disallowing SVM_SEV_FEAT_SNP_ACTIVE
for an SNP guest is bizarre.

E.g. across 2 or 3 patches:

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index edde36097ddc..7db1bfce4cca 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -307,6 +307,10 @@ static_assert((X2AVIC_4K_MAX_PHYSICAL_ID & AVIC_PHYSICAL_MAX_INDEX_MASK) == X2AV
 #define SVM_SEV_FEAT_DEBUG_SWAP                                BIT(5)
 #define SVM_SEV_FEAT_SECURE_TSC                                BIT(9)
 
+#define SVM_SEV_FEAT_SNP_ONLY_MASK     (SVM_SEV_FEAT_SNP_ACTIVE | \
+                                        SVM_SEV_FEAT_SECURE_TSC | \
+                                        SVM_SEV_FEAT_IBPB_ON_ENTRY)
+
 #define VMCB_ALLOWED_SEV_FEATURES_VALID                        BIT_ULL(63)
 
 struct vmcb_seg {
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 41385573629e..b2fe0fa11f90 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -500,7 +500,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
                return -EINVAL;
 
        if (!snp_active)
-               valid_vmsa_features &= ~SVM_SEV_FEAT_SECURE_TSC;
+               valid_vmsa_features &= ~SVM_SEV_FEAT_SNP_ONLY_MASK;
 
        if (data->vmsa_features & ~valid_vmsa_features)
                return -EINVAL;
@@ -3218,8 +3218,15 @@ void __init sev_hardware_setup(void)
            cpu_feature_enabled(X86_FEATURE_NO_NESTED_DATA_BP))
                sev_supported_vmsa_features |= SVM_SEV_FEAT_DEBUG_SWAP;
 
-       if (sev_snp_enabled && tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
-               sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
+       if (sev_snp_enabled) {
+               sev_supported_vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
+
+               if (tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
+                       sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
+
+               if (cpu_feature_enabled(X86_FEATURE_IBPB_ON_ENTRY))
+                       sev_supported_vmsa_features |= SVM_SEV_FEAT_IBPB_ON_ENTRY;
+       }
 }
 
 void sev_hardware_unsetup(void)
