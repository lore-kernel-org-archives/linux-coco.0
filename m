Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BDBC2D9
	for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 16:58:23 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-40c72caec5cso11291cf.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Aug 2023 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692032302; x=1692637102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/WoweT55sLO5fRn6kufHuPlBBPxo8HUXjSRuA4Mczg=;
        b=Q0fc8BLqD7wyXCOAOk3IPDV9Cp5h/LQhx8w5FeDc/Oq4xCCNjGiU5lj7eVG2UDAi6G
         gGKMMSEj7LdqNHelfpKXokpTmkEFBPK6JYd8ld6zO95MjKEBiP6fI8HxhvZrtBzgcmlR
         cugbBFjd5mmw+vkHfF9Cm9YLJ67TZrAHPcKCcqrOKlonZr3F12NeFub35TIFi/dEdUzu
         FNpHd4c4rMjTr4IK7AohAigfWCtG8EEekRBSyf7hUiUQzQ56cgtAZIOj0lS+Ne46ZzAn
         UXrIAr2vFref6NqwfEAmWNR/V498cbQ97SQq1LESFt1XuCEnzpFOHNjIO9u4Ve6lkj6A
         1tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692032302; x=1692637102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/WoweT55sLO5fRn6kufHuPlBBPxo8HUXjSRuA4Mczg=;
        b=UUU7LV44/Ht5m4ToQcqYJpZryVeJYw5xpumDQQjM7Gu+NnUA1fA7bx7pjji0+vuYbh
         0svdyMAc941FJp0iNH3SSaPoEacXwEhYLtVrn9b3mp/oAo0iSP/M7/CFnjjkLK2QWRFk
         axNFnyCAGH/3uL+iQeCZ/403W1zzQC7ExPfyyGxgmh1j/n1VhJHwgfkd6mgCgvdMGcDw
         GIh+egQv3puagCDHj5yL3WrHdB+7XWEdF9EPfrxy75e9FpJY12Xjzd1MT1iYLw6QaE++
         F4dpPozmX9vj3cz55i1HV6VHiQQW6ZOT3kClzAfYhhU6NPlugVCygLZGajcgMxihaI33
         x8UQ==
X-Gm-Message-State: AOJu0YzqtcpnPQzgORvvFJZQAL6P6y7bdpOm8veXeUWpLbe5cgGYCOCN
	LiDYFUBVg2xiXJWXXLevbZongSg3enbiE7Am/NITeA==
X-Google-Smtp-Source: AGHT+IH+ZEsxASbuHJbtYOaL4jiCGRwyq9SBYfbwVUTjbFILjWP+xu+p/05rzPYZrbX5Rmv6vLcEDwCgX13wDicyzFU=
X-Received: by 2002:ac8:4e55:0:b0:40f:ec54:973 with SMTP id
 e21-20020ac84e55000000b0040fec540973mr684272qtw.22.1692032301951; Mon, 14 Aug
 2023 09:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199900677.1782217.12516417657696965559.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169199900677.1782217.12516417657696965559.stgit@dwillia2-xfh.jf.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 14 Aug 2023 09:58:10 -0700
Message-ID: <CAAH4kHbRkFdmdQyPHjOjnnyuYXPLT2GKmQTE8fU9aDFMtri8ew@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] virt: sevguest: Prep for kernel internal {get, get_ext}_report()
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, peterz@infradead.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
>         switch (ioctl) {
>         case SNP_GET_REPORT:
> -               ret = get_report(snp_dev, &input);
> +               ret = get_report(snp_dev, &input, SNP_UARG);
>                 break;
>         case SNP_GET_DERIVED_KEY:
>                 ret = get_derived_key(snp_dev, &input);
>                 break;

Do we have an agreement around the continued existence of sev-guest
for supporting derived keys, is that similarly slated for the chopping
block, or is it left undecided?
It appears your choice to not include the uarg/karg extension here is
deliberate.

>         case SNP_GET_EXT_REPORT:
> -               ret = get_ext_report(snp_dev, &input);
> +               ret = get_ext_report(snp_dev, &input, SNP_UARG);
>                 break;
>         default:
>                 break;
>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>

-- 
-Dionna Glaze, PhD (she/her)
