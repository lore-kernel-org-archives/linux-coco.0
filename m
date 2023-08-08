Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14F13AFA
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 18:49:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4036bd4fff1so50861cf.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Aug 2023 11:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691520549; x=1692125349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh3g3xzDTV4b/0rT3NYTC0qmjiPKkmxg3PT3HLqCVZY=;
        b=zRZUveJH1KZRH6tYQ1yGZPSChFIbIeV6NT3uvNZujkhvRKwM95maPvj0D1SzvwSNey
         T9uvqSCtb3wHomjfs6OYQxd0fYUXIcih9rr3ab2iQvui60Tv5IBJWUlfdVQPmRe160Hv
         bFt0TYrE1wAnPlywT9LhmIFzigT3OeLia2ZZ0kcnxoUwoMQKwJV77L1wNSAnRe3WjUT1
         OK3rHZYaeGLFzWk6HRg/Po/gOu0eLZeE/vzNQdgECLRNT44O55w1dKrxxZJNNbR/DHce
         zKcbndJFc3/KWf7wejr2EgLLdCA3X8t3pndqs5viKGN+KwrtUQ8MP2FLh3C/HbgZsVl6
         MnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691520549; x=1692125349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh3g3xzDTV4b/0rT3NYTC0qmjiPKkmxg3PT3HLqCVZY=;
        b=Ux1CgEEhG+EK2CMuuwHkheE0FVOy5u3GBnGSdimyh3ZLeBAeszVzSP4OnalxKV0fro
         +Zas/5kNvkVolfs1gB6LBh9A7lfKm5wZR1JMj1QLYvrflfq7npw+oYaaCXY9MgJ3WMS+
         e+kevQ4gN/qjwi3t6SHIQ+TTnCskt0Iiq7XUmsOgEiSwr7lWlKyeydybmGakTNY/MkNB
         +0Een9zshkOsLXIRWzjWZw7TCjZJBvlnRypm9PqraiovUQLm2lkcU8kh3CWBYeElBDIq
         m+4LkpuCOIKb1Ng14bPf3GhrxbviRkaK3ToHGmIbYQrXK/BM87TnCmFSXoWEO9pPrzX/
         VPaw==
X-Gm-Message-State: AOJu0Yx1nTmA/YTcLIprD87TyKG7XWCww/I8b6sibN4pkyCvQd0qvGaJ
	Frm5LYpKL4INLLbh+B7plKxv9QcBKoyL2JjbOlAlvA==
X-Google-Smtp-Source: AGHT+IHKG1g9UlJ1hPirgjC7AadcpCjA9ieQnjt5my7ufYVULAUOHLkcnYD66My8bA4sXpCr+wJFuOLoENiUje06R8A=
X-Received: by 2002:a05:622a:106:b0:3fd:ad1b:4e8a with SMTP id
 u6-20020a05622a010600b003fdad1b4e8amr49679qtw.22.1691520548584; Tue, 08 Aug
 2023 11:49:08 -0700 (PDT)
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
 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com> <f95d75c513c081d5bb8b5d1fd3b0a5d5e24ab467.camel@HansenPartnership.com>
In-Reply-To: <f95d75c513c081d5bb8b5d1fd3b0a5d5e24ab467.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 8 Aug 2023 11:48:57 -0700
Message-ID: <CAAH4kHYJrKPgWXn7+G_sZXoAs8fq2sDEyT-tyECPthdaaoXyDw@mail.gmail.com>
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

> Isn't this more runtime attestation?  In which case you wouldn't use
> the boot report.  I assume someone somewhere is hacking the TPM-TLS
> protocol to also do RTMRs, but it strikes me we could just use a vTPM
> and the existing protocols.
>
> Even if you don't do anything as complex as TPM-TLS (and continuing
> runtime attestation), you can still make TLS conditioned on a private
> key released after a successful boot time attestation.  Since the boot
> evidence never changes, there's not much point doing it on each
> connection, so relying on a private key conditioned on boot evidence is
> just as good.
>
> James
>

The TPM quote will need to be bound to the VM instance, so there will
still be a hardware attestation in there that incorporates the user's
challenge.
Anything less than that is subject to replay attacks, no? Am I missing
a clever trick?

-- 
-Dionna Glaze, PhD (she/her)
