Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5915AE7
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 20:05:05 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-40a47e8e38dso11761cf.1
        for <linux-coco@lists.linux.dev>; Tue, 08 Aug 2023 13:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691525104; x=1692129904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Gse/n1KcESVWhM7B7IDywbevkkJ8BX6XkqzvAh2wo=;
        b=h8CiTiA6oKfcPqnb/eqNMeSqNLiCOaqNFez8+Yi+QiIgsfxaNoRzSX2cNlNFaBDTTe
         tzcRf8KweTwO0zkVmd/rgBAGEbu2QxslkUsoI3YKuQ6IqWcdhjcM1Ij9vyiToE4x9VfT
         WjgWRuvhRH5cmPucD+OlPbphWq27dCD4iHPYn024y85zR35FKQiCWbu4mc6zz3AJ9a57
         qIS7cMPDA3DxGRdBE7eeNwlJDeMPV1+k7IIiAM8cUuXFEjbsC8SWoJtzt8wYoBrUtmdg
         fVXf0+JpGrdKfe+NYxVBSFh8EjYp3eF+uYe+9nkdPwAYuwg7YXNlCBbEFxeZzAlmkBSQ
         l5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691525104; x=1692129904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Gse/n1KcESVWhM7B7IDywbevkkJ8BX6XkqzvAh2wo=;
        b=W4IHlyRtBDxV5unyfBntm9YL15Chzf474DbnHEcS5Hcm7Au+QvYSZGU5BH3IZt2rD6
         RdoCQq07m8yVLgzEr/n/liS8J8uVfCnpCj640QUBBQkzvR0knoAvU7juWUac2k6KzaI6
         Dd609s80NqtX0nkv88BbeeFpJtnAHZDPuDehtuXbll+2iQPjGa7nxwEZ9KBhbDtjg0bP
         AECjH9XUVa0BpsHsGDLEuDTcKHzRC2xAtWCnN/Kcuo/isMRv1cPaTg03QIHJHx5mFMoH
         pKnJfwJehzQUHhFQgbQLK8rlAxs3grxDBryEGRyPmEyoEmvrETmpMiJ0IFOC2shH5jIc
         UHiQ==
X-Gm-Message-State: AOJu0Yx280Lq151GsxH+6jHLgZCF3QuUwjY/uqT0dhK9NhsvYecGZIXz
	AY/nsrJzddr9b3A1LAdOCah66KNRwWnx5QFPJYQVOA==
X-Google-Smtp-Source: AGHT+IGNBE6dFnyFADf1Zm7XSPB1CUPxxwK5Lk++7K/zWHyetI7bdc4dFgm5ZygS1qde1KTXi7lUYgHUEzLhJ2FPsoE=
X-Received: by 2002:ac8:5b85:0:b0:40f:d387:65d0 with SMTP id
 a5-20020ac85b85000000b0040fd38765d0mr82670qta.16.1691525104516; Tue, 08 Aug
 2023 13:05:04 -0700 (PDT)
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
 <CAAH4kHYJrKPgWXn7+G_sZXoAs8fq2sDEyT-tyECPthdaaoXyDw@mail.gmail.com> <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
In-Reply-To: <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 8 Aug 2023 13:04:53 -0700
Message-ID: <CAAH4kHYLPP5ehLBDkXxJQmnuFTjjRp+1tON5T9HqSxCvD1mSxA@mail.gmail.com>
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

> Trusting the vTPM is a one time thing.  Once trust in the TPM is
> established, you don't need to be worried about replay and you can just
> use standard TPM primitives for everything onward, even when doing
> point in time runtime attestation.
>

It's a one time thing for who? It seems like you're still only looking
at the 1. use case and not the 2. use case. Every different person
establishing a connection with the service will need to independently
establish trust in the TPM.


-- 
-Dionna Glaze, PhD (she/her)
