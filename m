Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9473375DE
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546103; cv=none; b=j/Z4O9sO+HSQKJl/yM+K2xa8qqQ8UojRXlQC3xyNtraDXzMfJFAP6Zkr4e7B7vxTbp3gO4WpbBb27oZ9JJuJPMZNXqDr1E5aiaLxuYQ7iT6jj7CJaYMqg2h2xl/lV1tww53gHnUtD5aMd1fsZOfskaf4TiRvOXSnRzMXWexBKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546103; c=relaxed/simple;
	bh=L5tvi7+IQDs+VRJpw8WX5BI2YljAtn95hgbTZZTzOw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG3N8YziR4hs6g0D5OhqCwi6eAv3ZT/E1HmVBHo4woFFtavlSkbZq2nNMKFgk2pC/FUdg18LH4fqjnF0OYWXDLnccZ8yiBVuMjfWPAN6omnGhGxlKDf0fHWkpoDiSXXrncq5Kn5T8bYRoRZ354ODiX4PHeWAmmw2doWMy2A95jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VeTVG+qU; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VeTVG+qU"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7afbcf24c83so2068998a34.3
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760546100; x=1761150900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCDXpcrAleflJDj99gPUKdddGhphTvnCdBCeqIcXopk=;
        b=VeTVG+qUNtOQ6QY/Xx/Xh/CSi339DGb0T4SyH9QObnyo7cruNzXNI91PueDOu3Qhkq
         bbVsflKaCpC2e47s3dNE5iguzsYSV3HXrWXAedG1CeBusAb4hzRaWAQzYnpIoC1GdxaQ
         b7FymKMgmn/mCbaF/PIc01VdGNq68Tx6gglu5aw6TtbtPnyVX4I2EGm7SSyKCHEMGgFt
         6bdDuJf4DyGOzHZNZ8OvVoY/fg6WYKRjijjEzkzEbprhIC3Yo4jmk3yPywN6LbyYmOpr
         LnYgbWaIJ0jslfNSRvLtgIlRHwXOEM/KYy3XnlhDrUw9myjpvAd1wIUxwOS7malLNrcD
         mkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546100; x=1761150900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCDXpcrAleflJDj99gPUKdddGhphTvnCdBCeqIcXopk=;
        b=Yq8zW/GmFMKwFAmDLL+Bywxb6qX3GhIzbjIBqsECP1cYX87gdfPqxvyzopt15MRSRl
         wYzKVgXjLseKDu/F8YmIoupjyLJR6XbNGN29O2Uzyu7Lp62cdrX4NWbG6PYjgFgpXPTZ
         6WfYE94Sw1iAx84D1Ybul1SGbRCJiJlDiyD1rJlIO/RWAY/SA1j/RoaoMJXfItteQUgT
         v2/AvdW51oOhx3M/RakWnTXrJOASaGfnoRhUL8iP2S9nk5ktPD64xUtlafXkiN4BmHXv
         C8yOv7Dr0AFBxlsTJMDhLwKywf3/rneA1G7vtrU6Z3PZTB5SJBjMjNlPnEFcY6Qm+s5J
         6Kjw==
X-Forwarded-Encrypted: i=1; AJvYcCXt2JotEuNnQkHsiu3LQoUZs8FTZap4c6jzVLcm1aKcPpPtSw+w8NsUfXCVkfhGGK2//zNZjoobB672@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9h1aTvPPRkXI72CTNWXy9jjjAdP5LM1dP0SSvalAcvGeBnQv1
	7rZvVw740KJyGjt6C5UyqY4/QLBpsrWyTxywZZ/MJHHB34tt9qQTN7et6HOuzvy/lNk=
X-Gm-Gg: ASbGncvj40J8xNDv1SOtBxNDyQGA7kJQu8SfHn9HgZPUITQ9y9vqYekjp6bYkwII2PM
	O0CVPxXFL5QgdLVOPF1qX+ptFD6aXy/w++fp4MNCD6aHMMX11lny32KchkhhwSAUJGYD8JD/K0d
	+z/3iVS9PA9rvqQvnPm/xokP+4VneDGhu9oxAkPE0zvc4OLEiN8k32MH4uuz83P0HQwqUx1Ekk7
	yy4fPa6A/oJ+l8Vd7wAtkOZATXMMUo8FFMT0W2EB5qtHjCtVSpE9UjKeMV2uB6qKcwoUypBSQcs
	js2zSXMNwL6PP327gKtooiL7CxCZjyhsAP5cvKs3GJgT1ql/9aiA7e1KMWMIU4yWqN5D9dgwAvj
	sPDKhA5Motr0bgkrjWqxNkV5rzg==
X-Google-Smtp-Source: AGHT+IEoFlFxHVOg3TlsEA/EV9K2+7van7rs1mfIHJz6ue9Awll3yFhXypIbfuEYnE5GhO0NQgK8cQ==
X-Received: by 2002:a05:6808:4f14:b0:43f:75f0:3881 with SMTP id 5614622812f47-4417b38b780mr11335099b6e.31.1760546100574;
        Wed, 15 Oct 2025 09:35:00 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65031fb8ac8sm2365203eaf.20.2025.10.15.09.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:35:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v94So-0000000HS5J-2mCC;
	Wed, 15 Oct 2025 13:34:58 -0300
Date: Wed, 15 Oct 2025 13:34:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 11/38] KVM: arm64: CCA: register host tsm platform
 device
Message-ID: <20251015163458.GI3938986@ziepe.ca>
References: <yq5aqzxy9ij1.fsf@kernel.org>
 <20250730113827.000032b8@huawei.com>
 <20250730132333.00006fbf@huawei.com>
 <2025073035-bulginess-rematch-b92e@gregkh>
 <b3ec55da-822a-4098-b030-4d76825f358e@arm.com>
 <20251010135922.GC3833649@ziepe.ca>
 <yq5a347kmqzn.fsf@kernel.org>
 <2025101523-evil-dole-66a3@gregkh>
 <20251015115044.GE3938986@ziepe.ca>
 <d5144c99d7c04e4ad09ed9965fa3512c203b5694.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5144c99d7c04e4ad09ed9965fa3512c203b5694.camel@HansenPartnership.com>

On Wed, Oct 15, 2025 at 11:19:41AM -0400, James Bottomley wrote:
> This came up for the SVSM as well: we want to expose things that can be
> virtual devices or other resources that the guest discovers.  Our
> conclusion was we either needed to share one of the virtual busses
> (like virtio) or do our own svsm bus.  The agreement was to implement
> our own bus, but we still haven't got around to it.

I think your own bus only makes sense if there is a structured
general discovery mechanism that can be used to automatically
enumerate the devices to create.

If you are open coding all the discovery via C tests in Linux then aux
bus is probably appropriate..

Jason
