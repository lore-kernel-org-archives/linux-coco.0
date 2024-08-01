Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CAD1B8EAD
	for <linux-coco@lists.linux.dev>; Thu,  1 Aug 2024 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534013; cv=none; b=l8Se/V5cgCkU/tRwuHvaQfCDmdfNOGH6rmazfpt8+GO8CD3b4Lo0vkU+PFDpFkaaxeZWrD3L84HndndQpfgi2Eng3Hs1v28HTMjFk1eJEzyEhGrUujfdh+CgE6jjl8ZbjfMpO/GgM2KPYpQ5ADXIdODZ92jlv28uwVMYIK0F/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534013; c=relaxed/simple;
	bh=gFGo8dOk0VJiQQUAK+INl3O/L32blZxmPO2Im/Zhcug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SUIpqler3lip+4IADiAF4Cwgok52YUJ3zQRb756TKwETjQ+RqqsaC3q5Y+UuG/NkybSPCoP4+2+qAPTzI0vXm+SelykkN3whnA40I3MXwkX+MkaDFmIzXXNH1jbWCURItCTtuv2EhUU+2Bd0cX0h1NrydHcdKgvByWXahIdkl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Is5/jEOg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Is5/jEOg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2cb77ab2074so7485794a91.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Aug 2024 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722534011; x=1723138811; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9VNzcyRkgABAvNu7jY6d4RP7mTe7rlkrOwsOOfnmQw=;
        b=Is5/jEOgeoOSOnZujnZsDJZB66zQ4QyCBuOf0EGW9/OmVGHCb7i4GacvfDmB0iuzes
         7VvYAAFsqK/v7pIua4a/Uqe27VV/LMEJ/sYUc5d+mt8KYlwls7bGbTaAwLL99gvWg5i/
         aVa1hwUGO758tprWFzGXGvHwUT8G3lEtK2mg9+0s8ZB4L/nDgeiwnjboHh3bswIQ71vB
         WqqL1inZnold9RIxUcYbW4FFLm2NT8ft00YY7bLutEc/nmXArFwpWIpiOhLV+PdF3jGz
         Rh2U99GIx82gGHQbk92qzjmshwHN+hvDtYk4+ELAGygNxxchG6Umrv4/PRtGre5HPD69
         Nqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534011; x=1723138811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9VNzcyRkgABAvNu7jY6d4RP7mTe7rlkrOwsOOfnmQw=;
        b=uipK9sONpcr6GAoPuSOunVHdBoy204a75uE3OjJQ0E5h/P3hjUM6M7yU0qhdP+folN
         KbZn7Bjam0tyG03DP4ko7yUF6OD7fE6uB0+PFGQXCgE9DqUm/utM4+E2IsR5Q+kab73h
         uMdgS0/ao26bkhD34FmfslSRC4FTas3BKn/GkP6q3DRDDXIuMnZ5vjF7wSzTcH3i7XLi
         O9C9CnPy1o6KVEtnS1iwG1ffk3lFqVLo8Fsv2Rx6p5MkAzD47710JFDtfAmeeotGRynT
         Qt0p4Dn9gUCt6oIdHewi1f2vC3sRTUEZtwNoEHfPEJlV8QESPN9hZdiOmMI7yE2CQvln
         HEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUArwxHf5hJx+7KAIig8wbQMHcYjSx4yBcS3ZVmT6K24zfQo4CFfcLJI+5FVMEPxN21uyYx0Dm8ILTSFbC7S3SH/x/dPAFFIAP6eQ==
X-Gm-Message-State: AOJu0Yz4USy9iSvMgOnK94VucWRsYFrPlYqN73I84ZOHnbci6c2ESGqs
	0O2nfgS0iEYAgkfTdr+ItRp/r+883ONryOjx4E8JXGcI/V3vE3oq+x4VZmtatLcJifDmk89FhAq
	xeTEjtL8BTj25HgnLDGm+zw==
X-Google-Smtp-Source: AGHT+IGhpTZuKcEDE5QRQXsOfcY0PWgiRoUFns4CRvhbi/uTvBIXM/nvEmpt5cbQN5GWFoFa60I9eNfSq5lwKOiQpw==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a17:90b:e8a:b0:2cf:deef:4261 with SMTP
 id 98e67ed59e1d1-2cff954f844mr31201a91.7.1722534011252; Thu, 01 Aug 2024
 10:40:11 -0700 (PDT)
Date: Thu,  1 Aug 2024 17:39:55 +0000
In-Reply-To: <20240501085210.2213060-3-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-3-michael.roth@amd.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240801173955.1975034-1-ackerleytng@google.com>
Subject: [PATCH] Fixes: f32fb32820b1 ("KVM: x86: Add hook for determining max
 NPT mapping level")
From: Ackerley Tng <ackerleytng@google.com>
To: michael.roth@amd.com
Cc: ak@linux.intel.com, alpergun@google.com, ardb@kernel.org, 
	ashish.kalra@amd.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	dovmurik@linux.ibm.com, hpa@zytor.com, jarkko@kernel.org, jmattson@google.com, 
	vannapurve@google.com, erdemaktas@google.com, jroedel@suse.de, 
	kirill@shutemov.name, kvm@vger.kernel.org, liam.merwick@oracle.com, 
	linux-coco@lists.linux.dev, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mingo@redhat.com, nikunj.dadhania@amd.com, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, peterz@infradead.org, pgonda@google.com, 
	rientjes@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	seanjc@google.com, slp@redhat.com, srinivas.pandruvada@linux.intel.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, tobin@ibm.com, 
	tony.luck@intel.com, vbabka@suse.cz, vkuznets@redhat.com, x86@kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

The `if (req_max_level)` test was meant ignore req_max_level if
PG_LEVEL_NONE was returned. Hence, this function should return
max_level instead of the ignored req_max_level.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Change-Id: I403898aacc379ed98ba5caa41c9f1c52f277adc2
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 901be9e420a4..e6b73774645d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4335,7 +4335,7 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	if (req_max_level)
 		max_level = min(max_level, req_max_level);
 
-	return req_max_level;
+	return max_level;
 }
 
 static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc2.264.g509ed76dc8-goog

