Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABFBE4A
	for <linux-coco@lists.linux.dev>; Fri,  4 Aug 2023 16:37:36 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40a47e8e38dso310691cf.1
        for <linux-coco@lists.linux.dev>; Fri, 04 Aug 2023 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691167055; x=1691771855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTip6s7Loh3TOdN1yFeXhTIES4BpCWlKL7HeHYS4/E4=;
        b=3YpfqKRHnum/83XHfepMXHlWEUrgaJl2CQFZODv01ncw0wha2x2vgZTtq4sjRIH72u
         8V0Gucvrj8vGq7W4PJhg1dZBnx0TBPISMJUMImyNydgGUaGYNnDPOFT/kBz7nnWm6Z4l
         56+nFyl0TTd9k3hXHxQAfSftDvBkF2i02cTLm4zAjqJvVQntVLMAeJmtdi/nt86CefO9
         koN4JR6ZMw65YmvbZ5WuT+nr7mrxQTK87HGLlag8Vei8qGs4F0SCj48pMW46M7sHdV2X
         TLxK3juDIeG3frjL4FQaCfaRp9R4Bwi86OHitbaFNKTHq+8pWc8uMcKmJnCqG1C4lDDk
         5t4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691167055; x=1691771855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTip6s7Loh3TOdN1yFeXhTIES4BpCWlKL7HeHYS4/E4=;
        b=BNejTk9IeC7rCMnV5JJUHgg1IriRtEPwzas95fiGc8a+Re/9nH/xxaILF08NtOTv6m
         gB5urbQnjLHraXUmgvHjF/2s53JuB9MrJ92IzUCPAyB2saj3zNERJ2hZ7rSLBlem7EKN
         j6hucvgcYj47Gp8jfbtlmt4jCZTmYdEkEnuyb90Uc6U/EAUAK+aQPkCHA04NG7zrNpbD
         CY7DpAaN3vRyRFoDHZwHfeGvyiJ91Icx9J3R3QkFXXOjpwQDMXEcMo8qZL+PF96g1YiM
         EAhJicVAIfAT0HbPLCF31Wq3Lxy/TXlnrZ4Yzu0T1X1L2Z9pRa/+XAaeR0Thi1ldjkQ9
         cXoA==
X-Gm-Message-State: AOJu0YzIvhfuDLna0YjYFkh4Jo0eaqwsvQSpRtVxjpHgAyjAX8go1HXX
	+thcm5qBErTzlTYKwo51QjC6KGnfB2UB1TMc2cMCQg==
X-Google-Smtp-Source: AGHT+IFBYZGzWAQTPXplY5U/FlDzvzxWuptyu00swf4QfQ9XFIj+FlFYBzhKRzYMzY3WDqIW2nbJAOHId8SGyAgT8sc=
X-Received: by 2002:a05:622a:1449:b0:403:d35d:4660 with SMTP id
 v9-20020a05622a144900b00403d35d4660mr217786qtx.11.1691167054974; Fri, 04 Aug
 2023 09:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <169057265801.180586.10867293237672839356.stgit@dwillia2-xfh.jf.intel.com>
 <CAMkAt6ot9zyUL9Ub-qYq+d9v-6rTft4ea2mUxp3o1s3GVFq7nw@mail.gmail.com>
 <CUHEL5OD3UR8.FRBWNF6MTP1Y@suppilovahvero> <64cc650233ef9_782a329489@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64cc650233ef9_782a329489@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 4 Aug 2023 09:37:23 -0700
Message-ID: <CAAH4kHY_SjTdh55NBWn1KURCdjJUDM7nhi_gLpUhKKbRsVjX4Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] keys: Introduce tsm keys
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Peter Gonda <pgonda@google.com>, dhowells@redhat.com, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, peterz@infradead.org, 
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> In this model the kernel is only a conduit to get 64-bytes of data
> signed by the report, and the kernel need not have any requirements on
> that data. That said, it could. That's where I would look to
> recommendations from Dionna and James and others about what contract the
> kernel *could*  enforce to ensure that best security practices are being
> deployed.  I expect that also helps this implementation cross the
> threshold from "blob store" to "key" as the Keyring expects.
>

I believe there is no security best practice here yet to enforce.

Attestation reports are a power feature, just like a TPM. A TPM
doesn't place any restriction on the format for its nonce, and like
James said, there's already a special entry point for TPM-wrapped keys
in the key API. Users have access to TPM quotes through /dev/tpm0 and
can pass whatever nonce. I don't think we need to limit access to the
interface this hardware gives us because we're trying to avoid another
char device by saying a report is a key.

The coming addition of the SVSM to further isolate the guest and
provide extra "security devices" is also something to be aware of.
There will be a vTPM protocol and a new type of attestation that's
rooted to VMPL0 while Linux is still in VMPL3. I don't think this will
make sev-guest an unnecessary device though, since it's still
undecided how the TPM hierarchy can bind itself to the hardware in a
non-adhoc manner: there's no "attested TPM" spec to have something
between the null hierarchy and the more persistent attestation key
hierarchy. And TCG isn't in the business of specifying how to
virtualize the TPM technology, so we might have to manually link the
two together by getting the tpm quote and then doing a further binding
operation with the sev-guest device.

So, can we give unfettered access to the hardware through not a Key
API but an Attestation API, and for historical reasons allow vTPM to
be its own thing with extra commands? The SVSM could allow users to
have access to more commands than getting an attestation report, like
a virtual HSM separate from the TPM. We wouldn't be able to access it
without a SEV-SNP-specific device. Does that mean it can't be
upstreamed? Do all confidential computing technologies specifically
not differentiate themselves in their capabilities to all use the same
kernel API for interaction?

-- 
-Dionna Glaze, PhD (she/her)
