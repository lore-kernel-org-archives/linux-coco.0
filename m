Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76414F7A
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 22:33:55 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40c72caec5cso62941cf.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Aug 2023 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691534035; x=1692138835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/tES5rAsQhPvTCs9h8UWgD+l8tw6HXSBo83JhiuAeKM=;
        b=182OnsU2RltnldUtbZ/AOU5d9Y8aCkgpvTMT9ZFaWfnPkHr4K+p4gY+ZFhNMOoRwit
         0B/hSaJu13DG5y0JvLhTEs4+wAI8Ugihb4ScVmpT9wfXiQivzvlE4cPqIq1wfMNnKeyE
         PCe/tc4BVC8JTO6L0JbWfqvuCYd9TCi2PgFsQh1t0C/w93cuNd0WYpCTWTHFvWvR7kMV
         lyEXuJLzP5cMqxoWIv9OyOw5qAO5DdGND/cagx+wgJrvpsjO0XJPWUKQHW4zfj8kOoFA
         2E2F0pW4BN1pzHXr66+VUrK1m8OOE5tX7CTluoFYVkBo75cNg1kcxIIGvapqDSL8Nlbb
         MdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691534035; x=1692138835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tES5rAsQhPvTCs9h8UWgD+l8tw6HXSBo83JhiuAeKM=;
        b=Bv/psPmNJnNvt+q0+6NaYnoF3wkdkwHCeFOUk4voAlJ0trPYBm1pLG9xIqjjHtozGM
         nLabv3aSu3R6aHp2k3D6UuUQofAosB93L0c0dcly9AnnGNyhD6HtBFaesR0It41GEWL+
         D2Wt7Z90jYPwNe33DQefrjN7uBunfxFDB+nZ+Lb8qSqq0+lomBdEi5k0E2ZYYu5M6Q56
         DV/JPCe7WbskJc3v7K/jRPCH8UorREvl3CtYIBgYwYZC0kgufF3joDh4OhzpJruE/biV
         /IlHIS+ugpKp85tK9ulHupzs8kJp7Waga3L8VROfmApGiGfUv3gQd9NN1u7RFHdD+PSp
         djcw==
X-Gm-Message-State: AOJu0YyG+3VPe8ZBW7jl/VbFrnsMGdaPRvtOmTxrVIxT4cHRmMc61/Rr
	un8ErHQg8eMHYEZ2EpC7epJ9eJEcLReflMmHEFGD4A==
X-Google-Smtp-Source: AGHT+IGSvGPi6HYr/AfpIovb5Kh34w9cWI89wQo+sov7hzkFL74EanlnAbVTK5vP3DM2D3H+imknBwgB5O3xVJAVaO4=
X-Received: by 2002:ac8:7d88:0:b0:403:58e8:2d96 with SMTP id
 c8-20020ac87d88000000b0040358e82d96mr46734qtd.7.1691534034915; Tue, 08 Aug
 2023 15:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com> <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com>
 <f95d75c513c081d5bb8b5d1fd3b0a5d5e24ab467.camel@HansenPartnership.com>
 <CAAH4kHYJrKPgWXn7+G_sZXoAs8fq2sDEyT-tyECPthdaaoXyDw@mail.gmail.com>
 <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
 <CAAH4kHYLPP5ehLBDkXxJQmnuFTjjRp+1tON5T9HqSxCvD1mSxA@mail.gmail.com> <3ff1bee6d121ce76fd78217dbe3e5ab2f0134f54.camel@HansenPartnership.com>
In-Reply-To: <3ff1bee6d121ce76fd78217dbe3e5ab2f0134f54.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 8 Aug 2023 15:33:43 -0700
Message-ID: <CAAH4kHZcx6Gjy8sPeyshWeKyxR81zXwT6zYMV_uOdfyCsgNLMA@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, dhowells@redhat.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> For an ephemeral TPM, the EK should be guaranteed to be random and
> therefore non repeating, so there's not much need for the nonce to add
> non-repeatability.  So, in theory, the vTPM/EK binding can be published
> once and relied on even for multiple different tenant endpoints, sort
> of like the EK cert for a physical TPM.
>

Okay that sounds reasonable.

Regarding my other comment about daemons, we might already be in that
state for containers even without the sysfs proposal, given that the
sev-guest device requires root.
We'd need a daemon to provide protected access to the attestation
report (e.g., https://github.com/confidential-containers/attestation-agent)
so that's a bit of a sad situation.

-- 
-Dionna Glaze, PhD (she/her)
