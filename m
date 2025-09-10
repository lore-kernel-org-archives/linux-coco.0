Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C485321F27
	for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514075; cv=none; b=ZGox728JLfhV8bWfUFd3rRlwEuK2lERRy1QlyeHys6OPwfUrA74L5nb/9dDGAPbt1Fa/1XYpDyDNgWpXff4nvZuc9mpN1njOJz7C3LKnQa59XISh9OVqMHYO4bbHEjPdNf2GiacpBKLSiUbSgjotVjGdXWkqz9LRzK+qDG3dXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514075; c=relaxed/simple;
	bh=LNKhKhA6C3nXEhiScX2h3yeOP0cYoVecRbWOHC2eAUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyYZxlPrpJSFKC2rqDNS0dqxd0dJFO8xUughoHn5iIwZ0fjD+iDCrtCdqSK+41OUrdACywIVrYH2qTIICaLDEJOFuF2buys2+A28c+h0poBo11P37QEP4ECsL/xKOrbg01lUDCxQGg2sONsXdbfoq0raE/1n+DbgaugiebDJiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Rf2KQtZI; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Rf2KQtZI"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-81f9cfa70deso10147085a.1
        for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757514072; x=1758118872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LNKhKhA6C3nXEhiScX2h3yeOP0cYoVecRbWOHC2eAUU=;
        b=Rf2KQtZIcASJxmT9QJWSuBlQuA1sW1v39fIMOungMiMOjx0jKJJKMkU2KTI5sWATly
         VqBZcY68kTedJQQv4EO0/qR8RM4GWFeWmRA39T/mdoe7jGigUmd0verYlm9Db95tDDpM
         O+pRhY2b/NTDw3b+9vT6PN01s/WlXP1j8Efqp2ksTWy40d2aqPJvPdXVT2svoEmx0QGu
         xMuJTZN9+sPOae0Jnr/04bT7Xk0QHsR2Qf8WP0Czctz/erOIgxXvQCv4Q8jE/C3RatHu
         u9wT8Lpm/BLn1K1TWRjZhWOvn2yhvzKVJEffeH7K8c85lvDGDxw4D6OkB7OnQBWdoUua
         Ktkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757514072; x=1758118872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNKhKhA6C3nXEhiScX2h3yeOP0cYoVecRbWOHC2eAUU=;
        b=BBe2cGhh/HBtD0MEPknDGt2FFz+pywbpDmZf1dfr2mhpDApCluP4MRYtrT5PrUEMwG
         L3KTrFH5mCbvcdI27G6HUNp/WqYzOCHkC/FRfO+aT+SicIKnC1DTlWXHRqcu2VEqmYD3
         vWMmN+u55xCCI9FCcMj20/MUckjjKmxsW+22/S1pnjFEm93hUR5uPz+apIReVrf4n+n4
         VUxIxUh5AWeFIRbgn/3bv4IB8zI6Z3eEmrZc79/h+i//et5j7hY+S4Q9zDEVO68RJLbJ
         MjWoftaqwkFRsgsclXmk4qXhSafwtOBzVbZLVJ5iKRFiLgKFYnpmA9ZUx5SIMcp/td1F
         l7gg==
X-Forwarded-Encrypted: i=1; AJvYcCXho0jt19kmrva6qBt/9g0PERis5BE9UP3Na0K8bmiN5BNZlfiwqF2ZUS63611i8BFo9G2EZbQ2yFxO@lists.linux.dev
X-Gm-Message-State: AOJu0YykL5OCRNU28WITITaiGrj+YmLYPFTLtwsj6FaeqclunNEUOxsn
	gMBfREt9IGtU5vXsn8RVoZmD0n0x/eHmMGzv84wl//XrJ9MOv4Du49KksBXxFbp57JA=
X-Gm-Gg: ASbGncuoNdcKXbDJIyEy7bqNl4VojZ0VOnHJGaLfY6MqL0sRT4WoKFs2qMFVikgRIEk
	LwHIfDQ8xARoAKdts/CthJme3qxGSxxpoh+uE6RJm9oBh/TovLk7/PluHh3sOz2TWQZF0Y9BeEh
	imEpt6M+O29WOOO/yw39n/x5E0zsiUphbf55c0pYnxGmbI8VaVy8EpEWQovadIcMxUETkn54Bx1
	22AaOPr5KeVJVEz+sO28NuXBUzU3Xh7bWxG02d6mTNU8DL8tTGwVQ/O6v+nFFI2hZcqfkR7t8e4
	Js6lLaI1REcjgzLm9++MxOWxtpGLih3OdeKNhkhVoV/10xBkUPva2uIWOx+94fPGxyWURdXFWN0
	cD0jZMM9KSLa+R67TZn+AA/EBWhb0z1kdhH5srIC4seMgc8SoZiD1D3JYd/fQ0pG5LJau
X-Google-Smtp-Source: AGHT+IFQUqXdlLFuZHw73Bg4VN3PcnM2gIuoqeeTT9gq8x5We6/aliAOx3fJNb9QKgrD/fgUoao2tw==
X-Received: by 2002:a05:620a:4054:b0:7f2:8bef:93c8 with SMTP id af79cd13be357-813c443dcbdmr1375146585a.40.1757514072083;
        Wed, 10 Sep 2025 07:21:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed732f1sm299020385a.49.2025.09.10.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:21:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uwLh8-00000003roy-2q61;
	Wed, 10 Sep 2025 11:21:10 -0300
Date: Wed, 10 Sep 2025 11:21:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arto Merilainen <amerilainen@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: [RFC PATCH v1 34/38] coco: guest: arm64: Validate mmio range
 found in the interface report
Message-ID: <20250910142110.GE882933@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-35-aneesh.kumar@kernel.org>
 <d57d12ce-78c6-4381-80eb-03e9e94f9903@nvidia.com>
 <c3291a06-1154-4c89-a77b-73e2a3ef61ee@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3291a06-1154-4c89-a77b-73e2a3ef61ee@nvidia.com>

On Wed, Sep 10, 2025 at 08:47:43AM +0300, Arto Merilainen wrote:
> This creates a tricky problem given that RSI_VDEV_VALIDATE_MAPPING requires
> both the ipa_base and pa_base which should correspond to the same location.
> In above scenario, the PA of the first range would correspond to the BAR
> base whereas the second range would correspond to a location residing after
> the MSI-X table.

This seems like a defect in the RSI_VDEV_VALIDATE_MAPPING - it should
be able to consume the same format of data that the tdisp report emits
to validate it.

From a kernel side we also should be careful that the driver isn't
tricked into mapping MMIO that is not secure when it should
be. Presumably all the default io access functions should demand
secure memory in T=1 mode, and special ones like the MSI-X code would
have some special version to accept either?

Jason
