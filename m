Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F114F67
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 17:21:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-40a47e8e38dso12441cf.1
        for <linux-coco@lists.linux.dev>; Tue, 08 Aug 2023 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515274; x=1692120074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8m2sz5ofN14PKsEKJrI2xSIa/NZXT9WULPoAZ3lB9qU=;
        b=1Ql1zomo7OT8mGm5eChBkB3BZsSmWdImOFmc9ivT6OASGC4elHfNZT3MndUBI+nD6q
         iu0lKSXUksnT8Ans0Eiw3RcVgSQUWwmNdl844CEIeUCuzeB4YDxFc8VdNqYo/b+Wcfzu
         t/MgA82AaWHxqR+4xfSMV4gncrNUp5ly3z3U+zF2M/NmQ6OgFPUIhE+RVFj1IUgH2YLM
         7EvFVhfwtom+Ns8I9NCbljv+LJv7a0WtYrX0Eeruo4czP4e4A0FDf7agjl9uJzspk36y
         EUFYn5Aq6R4bw+mQkKvC2Lrklx4XmHbCUoBUbm8i8wNhv7Eam8RLedpMXJPu5o9LaadL
         FrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515274; x=1692120074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m2sz5ofN14PKsEKJrI2xSIa/NZXT9WULPoAZ3lB9qU=;
        b=XPJKfwM8wz5CgW16QgYokg9CMnTSS1YoGKMqeXC28G9C896XS7QI4zTD/+c1m1u8/F
         hkzp/MAUwqsx4vFEEwyzKR42vf5LX2Agbct9/rw2V3O6UOKkUhUEHZWEvho5SBLKQ7jp
         /g7/ZkAou4NdOxMpN0vdhTmoGr7Fia5Lto7bUfati/MEWlQvPIIMfW79jY3XZLre6PpU
         EhZHg1emoqaWZr2zFakNj/AlInv3cxgNt32JVIjEvsHBEnQEcQl1tvkAJM2H2QsRfnuw
         6YFlbv7WBMxT4QVMxuvMYWBqLqEuK8ypaDNRiVd1rldA0RWeNvFjrZWaEGPpP11GFwee
         ZOVA==
X-Gm-Message-State: AOJu0Ywym6iXzTGcVyro7jHehQe0ZDhzi87sgRU9cjRoenLaEjos4z/x
	XVcQnDhmMnR2FfzeaT2Lg29HIxxH4+DucbcQRrVIgw==
X-Google-Smtp-Source: AGHT+IFageD8Xz1u57GixYSKm20N8XHO6KbVXPJLL1PT98Mt37GF0ywxR1gnVgeRo2hCqp53F3eJr8SMw+iQeUoSS4k=
X-Received: by 2002:ac8:5850:0:b0:403:a43d:bd7d with SMTP id
 h16-20020ac85850000000b00403a43dbd7dmr15772qth.4.1691515274187; Tue, 08 Aug
 2023 10:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com> <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com> <64d270a2a68ce_5ea6e294f0@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64d270a2a68ce_5ea6e294f0@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 8 Aug 2023 10:21:02 -0700
Message-ID: <CAAH4kHYht5s4CkS5Y9+VotPH4WqDrzng0vYy89oq0_U16H_dDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, dhowells@redhat.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> I do not see sysfs precluding a use case like that. If the kernel can
> call out to userspace for TLS connection setup [1], then advanced user
> can call out to a daemon for workload provenance setup. Recall that TDX
> will round trip through the quoting enclave for these reports and,
> without measuring, that seems to have the potential to dominate the
> setup time vs the communication to ask a daemon to convey a report.
>

It's rather hard to get new daemons approved for container
distributions since they end up as resource hogs.
I really don't think it's appropriate to delegate to a daemon to
single-thread use of a kernel interface when the interface could
provide functional semantics to begin with.

> [1]: https://lore.kernel.org/all/168174169259.9520.1911007910797225963.stgit@91.116.238.104.host.secureserver.net/



-- 
-Dionna Glaze, PhD (she/her)
