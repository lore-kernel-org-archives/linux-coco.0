Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225C160
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 23:19:40 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a5so168420pfv.10
        for <linux-coco@lists.linux.dev>; Wed, 08 Feb 2023 15:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fHb6N+0e331hzGXmbgaDlgQkVYRmZJHEE0xE/4O7QNo=;
        b=JlFJTK7nXIGaRlHvc2KkKtp9yT/CU+5TQxB3CN9YCP755sdk230oKYAl+jfJ1wK2kr
         Z8AGRq22oLN+zqHSGxx0cWmFamVVi4mW3yRxzU3mihO7v7fN78NH1u1SVZUy/Taz9wag
         lMA/pHbJbQ0IfXAxxa7/+WvDTFRbmo6a4aKthqh+mwaFskgDponS742kwBhPytOS3VMu
         kMJ1w9/nZJEi2VvyCbKfTn4nCuWfnjvOgTKcRuxZDL3SkVg/BcNaCVDrx9EoxnOpVZzR
         N9Nf9hv9QFPkLpOA9dDFRNkoTDVoi1Jzz4uKA6n7GBaK1lUJfp2dbAXiwsL64IGGH3CN
         M+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHb6N+0e331hzGXmbgaDlgQkVYRmZJHEE0xE/4O7QNo=;
        b=t8PQWnpSPxw99WrT3WJb4vpAj6I3UuBsMM8TbCk5nPW4Jac3rALuq+2sWA9AG/1LMX
         41+PNkB/3HU3vaL5zrQpqBttkvj2cynBjR21NhEBxQkeTeOzwD6WM97oa2CblVpGCHsT
         cGyamlua/9CkaeYK6dRZwWpLsYzLNrxu4Dhyz/QdEfK/X6pt2mFJ/2H1DDa7sX8IdQvQ
         Rxyru5BWB4N0dvqVxui/ADkPmZybZD/5w8E5DB98HweBra3vWg5G7p9etnlcOVzT4utv
         kJfrhdffx/3LJywbNsGi69FIycWWRttniFMU1y9DLiFgqDoBWjPA5Z8LT5t4gH2sUVHw
         hlBQ==
X-Gm-Message-State: AO0yUKXZAPMdkYnTzJpmxhSR2KjiHOWbQaSF6YGsQICBttNw7MKGfXmZ
	zw4MG12j8hGHILLd11J4EVVj9/IgOU/gJME3MnjuYQ==
X-Google-Smtp-Source: AK7set8kKoqok4D93EDdlpdPayrL5k86rjmKmzw4YdpAUqTHuTpSNAXMG9TpRmmWBSCvYqGU8QkjYaMwFqY54ccCOoY=
X-Received: by 2002:a62:1c06:0:b0:5a8:1660:8133 with SMTP id
 c6-20020a621c06000000b005a816608133mr1157876pfc.23.1675898380071; Wed, 08 Feb
 2023 15:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
In-Reply-To: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 8 Feb 2023 15:19:28 -0800
Message-ID: <CAAH4kHZTGpkTwhShg1n-_4TBe5dQ5RZFowFGUwvCWdUH_saq5g@mail.gmail.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Content-Type: text/plain; charset="UTF-8"

8.1 You have RCX RCX in the first table where it is clear by context
that it should be RCX RDX, but just a small edit to keep in mind for
next time.

On Wed, Feb 8, 2023 at 1:55 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> Attached is an updated draft version of the SVSM specification with
> feedback incorporated from the previous review. Please take a look and
> reply with any feedback you may have.
>
> Thanks,
> Tom



-- 
-Dionna Glaze, PhD (she/her)
