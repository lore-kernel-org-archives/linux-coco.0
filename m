Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB38F57
	for <linux-coco@lists.linux.dev>; Thu, 31 Aug 2023 21:43:09 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-407db3e9669so19991cf.1
        for <linux-coco@lists.linux.dev>; Thu, 31 Aug 2023 14:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693518188; x=1694122988; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mZ1G6WYDoeO3Lvq+RNnrhZA1r2o8U/1/K3H65sBRiw=;
        b=GvkVXqt93v8dMUOr1SV4rVXSZ7h5BMbuZ2FWpWVmjd8bWiWH1CbK4tA7zX3W/SsKox
         6qVhlsJTSe3NZUZdeD1ivg6+x54H8wsJP5MBvafWz1UvN+nv0sEXZm8aMrhdjDeu/VEw
         7PTypE1erSFdn1dkxbfor3pP/Psq+ukXr7zIahVrMxuff4uCzw/PBsX+m5Ncl2gE5EXC
         oIpYrpqe+xefVqjC3FnoB9w914Gf8qc+LkhV/iIesioSGOohO3ynwyzhkBqs1C1O74N+
         FVIQP5SiY5oV3Lh78GdeChSlYvou1h8KTExYLgRlnR1chZBPB94INYXuA/kTWKXCbUrM
         p7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693518188; x=1694122988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mZ1G6WYDoeO3Lvq+RNnrhZA1r2o8U/1/K3H65sBRiw=;
        b=enonU2bSBd9kYbt2tCmfozgrWHgEDXMCPGGi5EgchUlBZRlg327+YlCh8/FGj7vE5U
         mVhMpBC1/SWsLmM9EK1KleJzWRatXPVplcwRsK6mi4BIRgnvcGvZAJClF3SHY6xr00yr
         pKF5mrseSHEQEZsKA7rMpCsLrCMo5AkCvDtQpIBuHtyIRkoLEqh9fgRSafHm5L+SXlxH
         dhR4AzRZoKbC6uqMpJgAn7XfkxvgH1VjIywdAMv+vH2OhBHPJIrTpjIZ9xh1dZ0isgbD
         toPj38NHvxbg5fn9NZc/ePVutCh+elEmsEr5nPuF2uC9JOxojG+xxwJsGzQYt404yMdC
         HSpg==
X-Gm-Message-State: AOJu0YxUfN+oM9pVHrS4CvQsmQHTeCf/ORrhINjo1Uh4Ic/d5TEFJtsO
	aOr+KCljokbRB670tfkDkXlNNq6IlTQfC+riJ6245Q==
X-Google-Smtp-Source: AGHT+IG7pahh3NiOV7dOHK10ykKRvqDUl/wZH0nf2uzIX1qDM/zlw41rANgNx8Ce0oUM7H0PnXyHz7JLZxjyJpTPVqA=
X-Received: by 2002:ac8:7c4d:0:b0:410:a4cb:9045 with SMTP id
 o13-20020ac87c4d000000b00410a4cb9045mr105945qtv.18.1693518187836; Thu, 31 Aug
 2023 14:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
 <169342400469.3934343.12316161608372095860.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169342400469.3934343.12316161608372095860.stgit@dwillia2-xfh.jf.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 31 Aug 2023 14:42:56 -0700
Message-ID: <CAAH4kHYNhiewBZ8Z_yF2F+ogkv_1UV8=Gu0KVDdTJN4iQKyNMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

This is clean and approachable. Thanks for your implementation.

> +static int try_advance_write_generation(struct tsm_report *report)
> +{
> +       lockdep_assert_held_write(&tsm_rwsem);
> +
> +       /*
> +        * malicious or broken userspace is attempting to wrap read_generation,
> +        * stop accepting updates until current report configuration is read.
> +        */
> +       if (report->write_generation == report->read_generation - 1)
> +               return -EBUSY;
> +       report->write_generation++;
> +       return 0;
> +}
> +

This took me a while to wrap my head around.
The property we want is that when we read outblob, it is the result of
the attribute changes since the last read. If we write to an attribute
2^64 times, we could get write_generation to wrap around to equal
read_generation without actually reading outblob. So we could end up
given a badly cached result when we read outblob? Is that what this is
preventing?

I think I would word this to say,

"Malicious or broken userspace has written enough times for
read_generation == write_generation by modular arithmetic without an
interim read. Stop accepting updates until the current report
configuration is read."

I think that at least in the SEV-SNP case, we can double-check from
userspace that the report has values that we expected to configure the
get_report with, so this isn't really an issue. I'm not sure what the
use is of configuration that doesn't lead to observable (and
checkable) differences, but I suppose this check doesn't hurt.

-- 
-Dionna Glaze, PhD (she/her)
