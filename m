Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DC522F14
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168436; cv=none; b=CUYTFN9m2qkhZ7O7yh5j394iO+KeXcD/74E1NXbejTT0SrtJpo2UTc2jXeqPqlwpCJo+HCDRJ7vsNJeQP4T+SQQ3wtmt+vwLpTmUUB/Upi/ijL+Tlr9d1beYwC4mWZs+7P5t9Va+pYcGKlpgpPJIF/cmZzkfmSJymnYy6GI2L5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168436; c=relaxed/simple;
	bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP0x2NYp7GAS1LpBHr4gTJFihMqk6k1LiGIq10AfA+wed238KiAX3kXLwdqe5v6cgWu+fenokyRCc9P7y4ZTx5rTFIeulrCm2VdCSHC07CrgMunsYhbWc6SveK+51TR8RNwEnobYGojwrz4g1pK42PM9ROkH+rdbQCvHIHdIsSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=o0m2Hhx8; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="o0m2Hhx8"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664d3421so544080eec.3
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168434; x=1790773234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=o0m2Hhx8QDoOfr7nyg9T4HPPr46PS7MbTIk/6zzbcJZtF6FKeJf3BnJ9kY0iMnBJBB
         hnDPqzQ2Ly0QPA+e12giMhdHs/4FCzoaErNG7jZ5UGOy1XUDeXbsEaszAHm3yOa8hSoh
         +oCnBJO+aMfALgiWaIocd02AtYg1elXBKWz2EBp4r2G+0c6ZohBp3tlp08gsv+Bg4nZT
         +5Y8x3IfukVcrsQPLje0MMWyjjDz/pmlasBo3N8gbvTemEyKoNzm3k7qYXqnfIJEZIp4
         MUWZoKboilrB6IxLbpE1dD90KrUpydYaAv8ttVgdhkIvhpf5rzi9QXZCrMJWydOiCmRc
         VWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168434; x=1790773234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=LL0x2zg7Ko0o/NexibRbxd2tTf2UuYoUwQ7mwcRctPZ6I0AIAivEXWP4itxQZ6Qhgq
         E6bL6LRNXVLPMbZGKkHij0y4MXoC8jXZXA9Ui+OUWjgAP3Ug7T8jZE/MNfx1V4tTGTFh
         PyH0IIlmAK1YlUDMGJmpvhPNQqT0sZT/n5qbA8LeSjOCYbSMuy2KC/B5gZfJL/kSy+LX
         HOEg0yxlpVC5rU/j8oO+TA19TphbauK4dmIwIPxKNz8RwL6B8Vcyfpnd+nFVf/6O/eso
         Qvxd4LlnOD3Ji++O0Et9OEgFDYL9WmJUSJvNo3hUYOgAR2mcVtXwUXHT/jnjlx9MjfGb
         PjGQ==
X-Forwarded-Encrypted: i=1; AKwUvByiP4CnZ8KV+8kiRJFHT3/aXZFsCwTefRpyCaqAxmjNTDb33z6ZaTpd4L4fUR9avFtyQ4H40pLdpAE+@lists.linux.dev
X-Gm-Message-State: AFuF++kXvS65xLvnzhYRcXe3tH2INlFuzsBnMFZYhyocn1atyGX4SpOf
	85UOiwFpDDd3J5bweFrevLOtkl7sDyFitsbghjR5tcuJ/JdLY3QJyDfHkhe/bNKA8bE=
X-Gm-Gg: AYBFou3bYdvdY5kcemJtAETEc+Tuiy8T3m2Wp69lq0KH/sTYk90KP3Q8+0lm67HY9xN
	kOFpP2Z1PesWO0lQAANQLA1hLXTLyi5cBRON9r4ZmfO8DNQitbnvSmNT+NqMbWr2TeZRB0LDSVd
	DYFwZBp8W7j9a/MHVPEQ/j9597diBAhKB1lm3ek7c6zeB+j49r/tfAJVfeW5+YH1XmduW3hXme+
	k8MVuTTn40JqZvm1dZ7hEQwq3dxdYmh+FdSa+RCSdts4GCSz5MmAq3IsahKOZhGiAR1GClwetwt
	mX5w3eO+NxFyXG675i3WKBSPM68AE2vf0NjtYHLOavqbAy8zPbJdBH8kdiNBxuMiaU8K9Fv+ZUF
	sXy1sUfaAwjQhh/TUTlSuighjRoGOfUUF3slQjr41yNE8eMz0t2529Dy8tqc+N5gNZNtiut/Gim
	sEI9B977aUbneECoFYR24ONJFflogtNIFxbJCtogU84lZVme+TEjrA+A4=
X-Received: by 2002:a05:7300:7949:b0:31e:b832:be with SMTP id 5a478bee46e88-33e8c24a34bmr2627336eec.10.1790168434062;
        Wed, 23 Sep 2026 06:00:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm6859478eec.16.2026.09.23.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:00:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9MaO-0000000DYPQ-01dr;
	Wed, 23 Sep 2026 10:00:32 -0300
Date: Wed, 23 Sep 2026 10:00:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130031.GE1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOfD6syXOgQhZYA@arm.com>

On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:

> On pKVM, we want set_memory_decrypted() to zero the buffer
> before the host can access it (I guess currently relying on __GFP_ZERO
> allocations). Since no cryptographic encryption takes place, there's not
> much point in memset'ing again after the operation as the content was
> already zeroed.

It sounds like this a pkvm unique thing, since RMM always makes the
memory hidden, pkvm flow should do it too. Either inside its guest
set_memory_decrypted() or inside the hypervisor like RMM.

Hypervisor doing it is the right place, hypervisor always needs to
ensure guest memory is cleansed whenever the guest gives it up. Either
via a private to shared, unmap or just exiting.

> I don't think cc_make_shared() has the right information on how to
> safely and efficiently do the zeroing. That's only known to the
> set_memory_* backend. So you'd have to propagate the flag down.

+1

Jason
