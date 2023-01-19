Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6F3D6E
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 20:36:05 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 36so2501716pgp.10
        for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 12:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=geNr1E6VfBEr6rNDuNt5xZRGvMS8AANNdGRpDjlpRuU=;
        b=Iz5otatIxfEwMlDKOapnMMO592tFYuufDvsRgepbG9Lwd4QGlufz5Dl1lYejAJruJq
         33/30rrzenH9TRxIlCwvCDHh1iqm1pIZOAxmy+FKb6tZhdlMuWznkISuuSDd7d0oq6zg
         RJ7JJJq26Mrw5WNdK8ic6xb9E74jiaVpl3Tes0OdEvZoxOwjsuEbFeM08H0sgxXZe9U1
         zr0+8YSVECHB0GYTME1UzvOcbTbZ2dRJIPlOZ6euEk6w8iFtuAW+Cv9xFFz2N31nMN7G
         ZcGaeLWfARNbBlBsNW+Cq8XSbrVzVMR2/TlJZpqqsj3z1nvE3nsLxTGbaodzsE93w9cA
         QGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geNr1E6VfBEr6rNDuNt5xZRGvMS8AANNdGRpDjlpRuU=;
        b=1vuHIceLYuk/kiiXtTyHoak5KYhPnsSBExlq+889wYSDre9AY0yEwZ0K0AHfrTFewA
         xbTIjDr/o9x7leehkVys8nyXHne6gMebPZcV9br29DgL9Frbp/mMfNeIBjjOSg18Eak7
         i4/8TR1l4sNw6Fq5gRvzbZD1xTXovMIlYn10cOVs9fb8ftB6t3dRAPUAQS/hP978UsfQ
         athvdp/eJkBUPqwIKbicNQSbaWFFpQ+xOebc4Z93/XCQ1cR3Wu0x4M7WTIQQbZYaeRxj
         0PgNAyI53RsZCwzFeqHh6ZsAbhqii3px/HUNIUJ+MRUikF3NyomyZUZHVmXhMZoVosU1
         iTRg==
X-Gm-Message-State: AFqh2kq8j2stMAIrNv8yrDd8qea2hFFrIu3V/AEQQNzU8tszuttBKurM
	Aeoh45dWXCXteZoK34q0iI+NkNvOLRpk7pdqqXJXyA==
X-Google-Smtp-Source: AMrXdXuXWIkBvjeABJVhFjJg/BU1DXB+KocDp8hkIozqTT9DBpOmCElWzlT4csdohivH2Pe8ccTDvANtE0IQdxcA/rw=
X-Received: by 2002:a63:2447:0:b0:4be:c5ec:93e1 with SMTP id
 k68-20020a632447000000b004bec5ec93e1mr1074292pgk.213.1674160564313; Thu, 19
 Jan 2023 12:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221214194056.161492-1-michael.roth@amd.com> <20221214194056.161492-53-michael.roth@amd.com>
In-Reply-To: <20221214194056.161492-53-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 19 Jan 2023 12:35:52 -0800
Message-ID: <CAAH4kHYoWtM=Xe0kgmtKw01-45DefEikdLz0qUJRRMLdZHzkwA@mail.gmail.com>
Subject: Re: [PATCH RFC v7 52/64] KVM: SVM: Provide support for
 SNP_GUEST_REQUEST NAE event
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, wanpengli@tencent.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org, 
	ashish.kalra@amd.com, harald@profian.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="UTF-8"

> +
> +static void snp_handle_guest_request(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
> +{

Both regular,

> +
> +static void snp_handle_ext_guest_request(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
> +{

and extended guest requests should be subject to rate limiting, since
they take a lock on the shared resource that is the AMD-SP (psp?). I
proposed a mechanism with empirically chosen defaults in

[PATCH v2 0/2] kvm: sev: Add SNP guest request throttling
[PATCH v2 1/2] kvm: sev: Add SEV-SNP guest request throttling
[PATCH v2 2/2] kvm: sev: If ccp is busy, report throttled to guest

http://129.79.113.48/hypermail/linux/kernel/2211.2/03107.html
http://129.79.113.48/hypermail/linux/kernel/2211.2/03110.html
http://129.79.113.48/hypermail/linux/kernel/2211.2/03111.html

But I don't see these on lore. Would you like me to repost these?

-- 
-Dionna Glaze, PhD (she/her)
