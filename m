Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC44374D2
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLLHxmjt"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so2719a12.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697497919; x=1698102719; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INYfmMsWN7edn0Gii+wE0NftUpFkex0ev6KVgsT42SE=;
        b=gLLHxmjtZXJ52BgZpOIVxLXhHZ3z5cMTYZWuEsp567bsVKGVba0OeUMuoQi/tFlGfy
         Y69W9QfEwYmw/iOKVgdIHN077vKhbzeOjgbeek0J9oQLJkJh0ofjNWqkisz9F2ZV9PSQ
         6ZvF/HsSTHvvrhwvbBnOnUYJNrB2tgD6fXEEj5U/i627/20bMOQ4R2MPkG1BhnAH14tm
         c5iFthtw1sGwJE6sjCjsBkBdNl+Qolg8DmdmJHQ3jeGjbNXc95ZeQ5C8fxXR20Rpn/kN
         la+fJPimm5Nh8K7QD1ZN3Y1zF7t11SHUii2OnBIEgnVJFcvq54Zdhx18tQGTV23DYYRO
         6oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497919; x=1698102719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INYfmMsWN7edn0Gii+wE0NftUpFkex0ev6KVgsT42SE=;
        b=oqb7zI39B6rmnfouI6oO2UMRAOwwMV3R3T31e2f1ylTpEFxeib4tu3K8Qcxf9qnc/M
         X8HeZDLvO3wkn8wQJf8X8f+XWGcFtBtblfQt/1kABMtWJT1Ev3tN6PoHdHmUD+sGCB07
         NnZbH3x49JBoj5ZBHmx1JCpArnux3dxMPCtfz3Lbpb9odeHwv7wUfpEMWFUpllRsTz6w
         ZuNm3PGLJtPHIXbWhnuJBLxrViDK1/I2iilwme4HLWLGntHop2Ffls9y6xu23voMlBgM
         5JFmxTUmxkoyBOGXnQESSsDe4lWYLdTU7SDNeBxP+tGw1yKpgc52eCArQud5IjgOHIo8
         m94A==
X-Gm-Message-State: AOJu0YydEs+ChHJJpLxbPlrY03zKXrE3mvNJf8QOPIah6VV3/Muh4fg1
	r7givNF3heR5VYD/m5epTyQTbikPK+tbnnYDXVM10A==
X-Google-Smtp-Source: AGHT+IG1cYwz5bu/5ZgBzdw9ECTZUbCA2/P7RKfZVDqe7dVEa7NHVFBLtd0yrRKFg2ZVXhodz1Qj9XcCQ0fTbqf323w=
X-Received: by 2002:a50:c31b:0:b0:538:5f9e:f0fc with SMTP id
 a27-20020a50c31b000000b005385f9ef0fcmr56602edb.0.1697497919196; Mon, 16 Oct
 2023 16:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com> <20231016132819.1002933-47-michael.roth@amd.com>
In-Reply-To: <20231016132819.1002933-47-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 16 Oct 2023 16:11:45 -0700
Message-ID: <CAAH4kHYiV5M+LK1Za02pC3u8hG8e2utybadxZPG94q12YsnSBw@mail.gmail.com>
Subject: Re: [PATCH v10 46/50] crypto: ccp: Add the SNP_{SET,GET}_EXT_CONFIG command
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="UTF-8"

> +/**
> + * struct sev_data_snp_ext_config - system wide configuration value for SNP.
> + *
> + * @config_address: address of the struct sev_user_data_snp_config or 0 when
> + *             reported_tcb does not need to be updated.
> + * @certs_address: address of extended guest request certificate chain or
> + *              0 when previous certificate should be removed on SNP_SET_EXT_CONFIG.
> + * @certs_len: length of the certs
> + */
> +struct sev_user_data_ext_snp_config {
> +       __u64 config_address;           /* In */
> +       __u64 certs_address;            /* In */
> +       __u32 certs_len;                /* In */
> +} __packed;
> +

Can we add a generation number to this? Whenever user space sets the
certs blob it will invalidate the instance-specific certificates that
are settable in KVM.
The VMM will need to weave the instance-specific data with the new
certs installed at the machine level since we're not adding
interpretation of the cert blob to KVM.


-- 
-Dionna Glaze, PhD (she/her)
