Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3112B4C7B
	for <linux-coco@lists.linux.dev>; Thu,  2 Mar 2023 11:27:10 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b13so17263659ljf.6
        for <linux-coco@lists.linux.dev>; Thu, 02 Mar 2023 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677756428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJb7ZUgVLyd0BezCYruMgzCjIaGRbn8MEvGz3yq2uQ8=;
        b=DBbo45ZyhnENO2PQEeIoAWIfplHoenM9uv102K8FoBn5IlQ/F3IbS2pJVKCBQQl4Z3
         cDacFzW6IqmfjlggpJyJ9u7ZveV4kUH8S4ZQ3eHeOuv3LnwPGSyq3prWTkijFNJLqgUz
         zdKG6Br34pnwCnp9yjJda2djJ3YPnYovU6dDQnnKHBmqOlW4a5QvIdcuEajrNiwBg/VX
         JDnor36TEOvosU86JgpMLKpRLVerkqcJEVFcyhKt+fiBpPpixQuTiCPymUf5JwpfPbEY
         N5QbTv1xuWXUNGYWNDkI02TUeGtk1y3PbKzaKRJHDD/2Z+VF6Zy5cx6vlgQjDHHNBxxW
         +GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677756428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJb7ZUgVLyd0BezCYruMgzCjIaGRbn8MEvGz3yq2uQ8=;
        b=1/6UfIGzJSdQ10oBiF2cN7kbPEhem3fq1s/y+Qnx1lSpDAzfMKCQaQ326sd81uwWiT
         eW/M6Cu/Llofa/qscG5TCEN2PeqFgyDGjrjBmy5Tbx5oXKYgDsr5kDWewxk3YiJGcbzO
         xP7l49MLT6aTav3b19ARCTMEQgU+YAutxPlZzy6v0zX9Zj8bFD69wT5DBozTYow1IcRI
         JfOM3ShLoXbRaVNyb9SfODgVPUNJ6z9Ao54Qol8BMoOr0VSIdIZqSbVpr28GdcpzyTEB
         kqqQEnLjthJub2UpQYpUdtq31AnlEYPZrpcRYahIVp3yB51L7SruTu3g5PzwtPbwxjhb
         QE3Q==
X-Gm-Message-State: AO0yUKW/SZSElskGz6Ws6WX3arOsTjORxFgJCrznQmxq+WFSj543VwLn
	fxFP3lZzTm12+NCq7Mb11gM=
X-Google-Smtp-Source: AK7set/LBpmR3Ohx8+StI9clR/JKrsDH2fb2JnDl7qKrYvJxXVkoui0Q2HhcZRo8LAVSqRFwnfVepQ==
X-Received: by 2002:a2e:c42:0:b0:295:a024:f3e2 with SMTP id o2-20020a2e0c42000000b00295a024f3e2mr2796902ljd.5.1677756428052;
        Thu, 02 Mar 2023 03:27:08 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id be40-20020a05651c172800b002959b1162f0sm2057676ljb.96.2023.03.02.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 03:27:07 -0800 (PST)
Date: Thu, 2 Mar 2023 13:27:05 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
 ashish.kalra@amd.com, nikunj.dadhania@amd.com
Subject: Re: [PATCH RFC v8 54/56] x86/sev: Add KVM commands for instance
 certs
Message-ID: <20230302132705.00001637@gmail.com>
In-Reply-To: <CAAH4kHY6jm9PHjuGj18eyCC8H4oksuNkVL=igAh4P4BTsKs2xA@mail.gmail.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-55-michael.roth@amd.com>
	<20230302020245.00006f57@gmail.com>
	<CAAH4kHY6jm9PHjuGj18eyCC8H4oksuNkVL=igAh4P4BTsKs2xA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Mar 2023 17:41:11 -0800
Dionna Amalie Glaze <dionnaglaze@google.com> wrote:

> > > @@ -2089,6 +2089,7 @@ static void *snp_context_create(struct kvm *kvm, struct kvm_sev_cmd *argp)
> > >               goto e_free;
> > >
> > >       sev->snp_certs_data = certs_data;
> > > +     sev->snp_certs_len = 0;
> > >
> > >       return context;
> > >
> >
> > Better to move the fix to PATCH 45.
> >
> 
> This part isn't a fix, but part of the implementation since
> snp_certs_len is added in this patch here
>

I see. My bad. Was thinking it was the snp_serts_len in the global sev as
they has the same name.
 
> > > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > > index 221b38d3c845..dced46559508 100644
> > > --- a/arch/x86/kvm/svm/svm.h
> > > +++ b/arch/x86/kvm/svm/svm.h
> > > @@ -94,6 +94,7 @@ struct kvm_sev_info {
> > >       u64 snp_init_flags;
> > >       void *snp_context;      /* SNP guest context page */
> > >       void *snp_certs_data;
> > > +     unsigned int snp_certs_len; /* Size of instance override for certs */
> > >       struct mutex guest_req_lock; /* Lock for guest request handling */
> > >
> > >       u64 sev_features;       /* Features set at VMSA creation */
> 
> 

