Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8821AA6B
	for <linux-coco@lists.linux.dev>; Fri,  4 Aug 2023 17:07:51 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-407db3e9669so4821cf.1
        for <linux-coco@lists.linux.dev>; Fri, 04 Aug 2023 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691168870; x=1691773670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pX1oUNWicJgi5+i/eIhBxXMKRhDY/HTeveUyG/2+/W8=;
        b=POfCofqbTkkEP6CTjYYI+ZAsldGa348gWHfiPn3URAFzS4zKN3R3SK4pSfiIcOtlM7
         vBvU+L2Ijq9hPzDpp5SQ1y2TIs/MBkD6YdyVni5BC0TnyFOOpeUed5/nMmy/X0f0zROa
         xHaK7Vh0evnBeQhl1tfa1seLXdao7BXEasUfZqiGvw6CixBFCyr1cC/fCtbUo4+zUqcA
         N+LAfGU/shPHPod1gkP1dYHf8S9CFSqrgjxuBxFJy5jCq0Ts7JF5LFjCVfGZ3YyU6zYV
         IVZZYtlckaxTkDZeHXQcCK16QPytQ1/YbEny5Dt+h3o81ytoyNd0FBp8fn5j4SrLptFF
         DZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168870; x=1691773670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX1oUNWicJgi5+i/eIhBxXMKRhDY/HTeveUyG/2+/W8=;
        b=ammGeLYHowkjCpzv9VvkwIdke2YFwtTG3O7v5HYP8veH9tAqPHV5gYHQUfBeENKW1z
         3O2raBpoRwVCsYEHrBbuv0mTZ9fH1cWYnQK9bcT0TNSUa/b8OpJ2NK9VjVCo/+cFjAJv
         s0mUQIh3H3SFMDgqQVcK8kyL57FiVTQWtwD4i8oHV83juqMv7ydOqYbcQ0IuA6tnR5OB
         TUIo9U/5FytZ/xe7AAU7j35E3h8gOC62nJ3jY/n//dCz8vWhjD9H7++JnFX+9doWr/9D
         oBqZyjdnUvQTq5MFFs+HTgm9vKhI20Sq5eM9+7roLM5lzq3rxA/250uMIvVxkpwWuGoY
         +ZcQ==
X-Gm-Message-State: AOJu0YzcCVPyea4DW0DgiFJfm7grk+KgJz2F8OlOPxqZO58AOgoz+Cqx
	+bOab7zMhwqB2EiH1BeebiqH2PQs3yfWsa6X8jq1WA==
X-Google-Smtp-Source: AGHT+IE1sxvAyP8+cDaxZdzkev4TDkkDmuaQSoqkj6Mq8oc9GDxkL/DHjOjnnnelzcBnh1ukBkfv5kCz3AMo7oW7c8A=
X-Received: by 2002:a05:622a:1c1:b0:3f8:8c06:c53b with SMTP id
 t1-20020a05622a01c100b003f88c06c53bmr14457qtw.0.1691168870121; Fri, 04 Aug
 2023 10:07:50 -0700 (PDT)
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
 <CAAH4kHY_SjTdh55NBWn1KURCdjJUDM7nhi_gLpUhKKbRsVjX4Q@mail.gmail.com> <66161ce56ec783d1ec452a50b80b120bec8b56e8.camel@HansenPartnership.com>
In-Reply-To: <66161ce56ec783d1ec452a50b80b120bec8b56e8.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 4 Aug 2023 10:07:39 -0700
Message-ID: <CAAH4kHaq0q0jGmpxskapo2J+oeWWBXuDd7RfgppO31+gnPSL6w@mail.gmail.com>
Subject: Re: [PATCH 1/4] keys: Introduce tsm keys
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Peter Gonda <pgonda@google.com>, dhowells@redhat.com, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, peterz@infradead.org, 
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Just on this one, it's already specified in the latest SVSM doc:
>
> https://lore.kernel.org/linux-coco/a2f31400-9e1c-c12a-ad7f-ea0265a12068@amd.com/
>
> The Service Attestation Data on page 36-37.  It says TPMT_PUBLIC of the
> EK.  However, what it doesn't say is *which* EK.  I already sent in a
> comment saying it should be the TCG template for the P-256 curve EK.
>
> So asking the SVSM to give you the attestation report for the VTPM
> service binds the EK of the vTPM.
>

Yes, thanks. It sounds like you have to ask the SVSM to certify the EK
separately from asking the TPM for a quote. We can't rely entirely on
the TPM API and avoid a sev-guest device for talking to the SVSM. Or
are you saying the SVSM attestation report will get encoded in the
x.509 EK certificate that the TPM API returns, such as the report is
in a cert extension? I'm less clear on how TPM software would
interpret the Issuer of that cert.

> James
>


-- 
-Dionna Glaze, PhD (she/her)
