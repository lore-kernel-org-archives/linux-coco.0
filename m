Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1014A80
	for <linux-coco@lists.linux.dev>; Wed, 16 Aug 2023 19:38:50 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-407db3e9669so3501cf.1
        for <linux-coco@lists.linux.dev>; Wed, 16 Aug 2023 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692214729; x=1692819529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNDp3i2bBwoOV1rWtC/ohzjbdWhzdLjzTZ59sTAggCU=;
        b=zauDROUUKvcs8lCQ/BfV9kcQA4HIORrUlzsCcdVtdntWypJgGELZqZcEPLioY0DX1d
         UZTL8VoPIfEhBk0xRjDcyf9AqwQrbV0warNe/Q5irckHL//x2ua7KFrsy9YP53ps8gIr
         Y25/CTQUJBZxNty4Qz8tQDZf36+O091toHhi80CCb7b0XTD8jR2DttEpmTMY19WOJcyO
         X/hU+x6DLfL7tVILoR3oXr77fDuqp4wQ7rgEtiSf+7j/37CGM66AepJOf4st574goUhl
         hcJa09xtf3ESJfDOe4BfolpD04dXesNC+RWoz2KCs0hYYa9GxZoWxlWIbPdJwYStxD+G
         47tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692214729; x=1692819529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNDp3i2bBwoOV1rWtC/ohzjbdWhzdLjzTZ59sTAggCU=;
        b=N6RWeB8MtxXAElcmCJt5RN1UG0/aILhiWTUbkQzHHzJ3LMP/JnI1woUFhAld42V0ij
         SGUdSyNUNZyGzTv9rsS2U/SAggy0mYx3JW3H5EHjJWVBR8+8JInUSgvkennZH/20sbw7
         aD1E5dnElTI//0P6wMqSRPcImCPbDFw1VIpfoCOr+wiuAKYpLUxPq/B+HcaAYq48o/VC
         7f9Vp3L4iodwbFqyv74oeKHbmU8E1Ea6cS1Rwwke9cmIo5OPyuCLugHBwNdi7gw/yYrm
         TEjWHBVFJR9DLtVjqFWgaETRhEyKqRAdBomfLG3Md1juoYeKo6ZYIotFi+WjR3AiwjiK
         oKeA==
X-Gm-Message-State: AOJu0YxqT0+1m07nfqQjTSp5UEChIgSiIkYKZu2vcSrpO9CGzGvrRNGY
	21RCotHq+kE1W/1CrKknbkKOo12c1uXUcC9NjA10cA==
X-Google-Smtp-Source: AGHT+IFpIaCPqotOsX3UISM7uhBPq1XQaPa+MtAyjklx4cxfSxVons1e1QLTn7tMSjl7u9VZ5PpbIJ+PhOxSqkDX0oM=
X-Received: by 2002:ac8:5e48:0:b0:403:a43d:be41 with SMTP id
 i8-20020ac85e48000000b00403a43dbe41mr53686qtx.20.1692214729529; Wed, 16 Aug
 2023 12:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199900677.1782217.12516417657696965559.stgit@dwillia2-xfh.jf.intel.com>
 <CAAH4kHbRkFdmdQyPHjOjnnyuYXPLT2GKmQTE8fU9aDFMtri8ew@mail.gmail.com>
 <64dab7a322eef_2138e29421@dwillia2-xfh.jf.intel.com.notmuch>
 <ed962dc3-1e7e-8959-7921-365fae705594@amd.com> <64dbe8079511b_47b57294de@dwillia2-mobl3.amr.corp.intel.com.notmuch>
In-Reply-To: <64dbe8079511b_47b57294de@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 16 Aug 2023 12:38:38 -0700
Message-ID: <CAAH4kHaM_hUPNFLpg-2unnBFL5b_ZYrrj=ZuYub9kR_CxVkqdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] virt: sevguest: Prep for kernel internal {get, get_ext}_report()
To: Dan Williams <dan.j.williams@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>, peterz@infradead.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Definitely, instead it was this comment from James that gave me pause:
>
> "To get a bit off topic, I'm not sure derived keys are much use.  The
> problem is in SNP that by the time the PSP does the derivation, the key
> is both tied to the physical system and derived from a measurement too
> general to differentiate between VM images (so one VM could read
> another VMs stored secrets)."
>

Key derivation on AMD SEV-SNP is not necessarily tied to a physical
system with the introduction of VLEK-based attestation. It's now tied
to a CSP's fleet of machines. We can use key derivation in the SVSM as
a basis for further key derivation based on measurement registers, so
the utility increases to provide something like persisted sealed data
that can only be unsealed when the SVSM witnesses a particular runtime
measurement configuration.
We can use NIST 800-90A Rev. 1 for combining keys from the PSP with
measurement register values for example.

> http://lore.kernel.org/r/c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com




--
-Dionna Glaze, PhD (she/her)
