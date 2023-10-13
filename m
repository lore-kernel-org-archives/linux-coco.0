Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F5F5663
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpgaMugp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso4832a12.1
        for <linux-coco@lists.linux.dev>; Thu, 12 Oct 2023 21:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697172241; x=1697777041; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc3DlkMqN9yCN096oaPCTP4IgPsNMOP2NIgwh1GTL5Q=;
        b=cpgaMugpYfQApi0/sa4VUIngixuSZLIgvVVS4+6fSwQOzTkrJ/5wH/nsymw9ajGRoa
         d2O1j/+DwXp2Ut2D/rugM+Tg/3k3YJGfIELIiZBOoUc7QNhYHMiMUDuf+vlGkHIB/Xge
         M893n1i+ZbR8bf6vCHCJko1+SqhEBJXjNvBK1B9JnIJowlOUWK35gtREyTWNn1xvQVXI
         9lo7l+4sUhQvcn5sCQbAapwOpUxIQ25MpSysRH8s1IwOdrCfFauFQ8TxIMotiZmzb2rt
         FHA/+a9+jCr1xQvBMfmJFVTTdK8qSU9OtDz369M5Q+deIFyFS7RLkZTdjZFmqo8MECuV
         CS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697172241; x=1697777041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc3DlkMqN9yCN096oaPCTP4IgPsNMOP2NIgwh1GTL5Q=;
        b=jikhWDNi/6AeAfjbTpyykYqSRSNEL/X8hId69cOXkn3CeADNVYne1sqp0EmTCch9Bp
         RpGGxEG6qAbmhTU2/lP/v2s5LTL1DZb8mHERY+U7I80kwRZ4JfXfE6oocjp+rok2bLuy
         ZbXS8RJq6Ye4bm0+ForN2GhbfBGEMxneyRDlkjrBC1oV+zMurci8utKSou0MWLNg4nxD
         uCzQmPDS3IQQ/hpcFyrwpb+7vSPTqfY/WC3xO/TZ9fEvktG584Y2S7d3Q4aXVJnIVnb6
         ASJYEg3rtKbeHPAx5rBAmF+c7GyGqVq9FQGGcbzxDCwOHWRlTooH6UEbvXx+Lqc4jTx7
         3n/Q==
X-Gm-Message-State: AOJu0YztsSdsNLuFuWw75U4z2aV+XjN35+CDknWZOT9Iad+hREoeN+79
	6rtPjnxGwNnHsL0l25pEDXrKXnpbgKjdJfgLZ2Ykow==
X-Google-Smtp-Source: AGHT+IGdi1XS1f5c4fO5w7TyJHiMyVdtH2uTtTT9VgKjsUkDnu5dXbp7DtnV7CTbAfgEW/YU8t0BDKyYOgjIQY/DkbQ=
X-Received: by 2002:a50:8e11:0:b0:519:7d2:e256 with SMTP id
 17-20020a508e11000000b0051907d2e256mr77357edw.0.1697172241324; Thu, 12 Oct
 2023 21:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 12 Oct 2023 21:43:46 -0700
Message-ID: <CAAH4kHYKOJcVdbEgey82aRcoaKzRi7qhHAtwG5pVNLWTwV0MGg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, dave.hansen@linux.intel.com, 
	bp@alien8.de
Content-Type: text/plain; charset="UTF-8"

> +What:          /sys/kernel/config/tsm/report/$name/privlevel
> +Date:          September, 2023
> +KernelVersion: v6.7
> +Contact:       linux-coco@lists.linux.dev
> +Description:
> +               (WO) Attribute is visible if a TSM implementation provider
> +               supports the concept of attestation reports for TVMs running at
> +               different privilege levels, like SEV-SNP "VMPL", specify the
> +               privilege level via this attribute.  The minimum acceptable
> +               value is conveyed via @privlevel_floor and the maximum
> +               acceptable value is TSM_PRIVLEVEL_MAX (3).
> +

I'm unaware of another CC technology that has different privilege
levels at which to request an attestation, but I'd be much happier to
see another example here.

I take it my feedback about VLEK vs VCEK selection is going to be left
for a future patch series? I can drop it if we can agree another WO
attribute for that won't be met with a lot of barriers, but I think we
may be generalizing a single data point with the privlevel and key
selection attributes.

-- 
-Dionna Glaze, PhD (she/her)
