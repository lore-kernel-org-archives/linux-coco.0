Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E499EA1
	for <linux-coco@lists.linux.dev>; Thu,  2 Mar 2023 01:41:23 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so1195019pjz.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Mar 2023 17:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ/k+I6vg3DIpuQkWsbGXKaDuFnWAPV+R/MRhIWgerE=;
        b=M1faUwzF8K9LVMgFawTxpJg0odDzVyBttN0AF69uG9guWjiSvbhav1cNgD35gDMKu0
         j1niW9n0QqE3EKJ1dLgwNzvMTsr/XSuX4cXlnqhLDSoEXOlwHLpg/HIGgMwqwQFoKLTY
         /3p1wvO6ecQ1YgClypzXuo5Z+9McY/e//LJVhv3UX6Kpq0CIXJKrgmeQRoYvzMI1gJrs
         GhDh8QtNI7ubX9ks3+BO7j6DV36t9q0rMBQcG43GtBzfzhnaGmfxqQjy6q1mxlVc/mvD
         dmoYB0/AEPJc7ihdJU3WdhAsnYUJK781v7iYPrrNrt88tgTT5g7Myt5GjBx8YtQisLfu
         4ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ/k+I6vg3DIpuQkWsbGXKaDuFnWAPV+R/MRhIWgerE=;
        b=kzw5CASv3L2W0PVKMxIjd9lzHysobMhbtzdyfVAKr5NtuoZrqqxLzgXOGsbYJ03AI4
         B8O4kE6F7118uHZa0DjwWx+YrsudrsHkBneAyYW8VsqwzvKeo+23+26mC2c3K1P4fo/Y
         cy41rhqP9B2Ur049QJ4lLAHNPR2HtwK6hKHn0PXmCB44snprzWuo49WtP/Csu2CEetP0
         ApjeWL8puu3KtzVVFmnhTpmRkne86o03JlUJjfXHTwaTn/zYH7F3JNEtWiH9WufbiSkV
         AeZjhZHP6n5YdHmgccpgWsVgFZvqyPwPBEhgcVZbs8pRkuTGS4db1BW5QTLoLWIA0k6V
         nkPA==
X-Gm-Message-State: AO0yUKWh/sL9aycVxLA1KwGNT+l+hFg6CYsxicWONCOVOQJjWO4Ph0RC
	onWgz5NZ1fXRKDMhSF0YL6tvtd4eBd9tEKklJh3dJA==
X-Google-Smtp-Source: AK7set96nV5WxVAFJCuff1YfyXG1LVejzmkonDIYcfNUk89kau/aG+VyPFxYaHWrc+2i5u58w4j88wEOxo3FDLY30SQ=
X-Received: by 2002:a17:902:7841:b0:19d:1dfe:eac6 with SMTP id
 e1-20020a170902784100b0019d1dfeeac6mr3274257pln.1.1677721282551; Wed, 01 Mar
 2023 17:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230220183847.59159-1-michael.roth@amd.com> <20230220183847.59159-55-michael.roth@amd.com>
 <20230302020245.00006f57@gmail.com>
In-Reply-To: <20230302020245.00006f57@gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 1 Mar 2023 17:41:11 -0800
Message-ID: <CAAH4kHY6jm9PHjuGj18eyCC8H4oksuNkVL=igAh4P4BTsKs2xA@mail.gmail.com>
Subject: Re: [PATCH RFC v8 54/56] x86/sev: Add KVM commands for instance certs
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org, 
	ashish.kalra@amd.com, nikunj.dadhania@amd.com
Content-Type: text/plain; charset="UTF-8"

> > @@ -2089,6 +2089,7 @@ static void *snp_context_create(struct kvm *kvm, struct kvm_sev_cmd *argp)
> >               goto e_free;
> >
> >       sev->snp_certs_data = certs_data;
> > +     sev->snp_certs_len = 0;
> >
> >       return context;
> >
>
> Better to move the fix to PATCH 45.
>

This part isn't a fix, but part of the implementation since
snp_certs_len is added in this patch here

> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index 221b38d3c845..dced46559508 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -94,6 +94,7 @@ struct kvm_sev_info {
> >       u64 snp_init_flags;
> >       void *snp_context;      /* SNP guest context page */
> >       void *snp_certs_data;
> > +     unsigned int snp_certs_len; /* Size of instance override for certs */
> >       struct mutex guest_req_lock; /* Lock for guest request handling */
> >
> >       u64 sev_features;       /* Features set at VMSA creation */


-- 
-Dionna Glaze, PhD (she/her)
