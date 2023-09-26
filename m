Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354D26E28
	for <linux-coco@lists.linux.dev>; Tue, 26 Sep 2023 19:31:11 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c625a7c507so48484445ad.2
        for <linux-coco@lists.linux.dev>; Tue, 26 Sep 2023 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695756671; x=1696361471; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7dcEcPqYBrLr8YEQVG+yRj/mrY2mvRq3Ti0eeSXoSU=;
        b=IvabzQDn+x3IeJQ5vBx3yjylUBbpPjleo8rieDDFDa+TT8RoCYw71a4HfkDKvK7EeV
         ajuyygf1Mx7bRmmoeXSrZ22LrkCAnhuNCREGGgmKspOf6AHQadgIKrySICAqZZmxYvhF
         2grirAZfsQxhB8uj3r4Au8furssp5YuqQw0CLcmIagRes3no2tgZSf4rToYOSlvsv72r
         CNgcayUBE5/JMMkxHZu1Fk807RFHiAUx2q8EYlTy99bmj/4P2vPQQ8aE+OLjFMgKDeCT
         SKZ+2XJYJ1lkYhQb2NHvUAuorlWPsc3He0wZL6QI4eTk9691GoRcKaenRPsyIuXTgUf8
         1NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695756671; x=1696361471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7dcEcPqYBrLr8YEQVG+yRj/mrY2mvRq3Ti0eeSXoSU=;
        b=WPZnQkhOhWKSrlXM8DLP6Az6mNbsbY5SB+rd3N1INtkRsOZADhUmgt0KTQKo4cp6OA
         ancG8PHkbUOqtTfXhTmHXDzt4ffrPMYXUBkHLl4nELA9fQ9IK5NNuD5BgCO7wV9Om8fl
         y0mzEJvBuDuK7ArGVIEwOmXIZWSg8Pm2NVgSufclQgLLG2JghXmQCuqaRb6jLMIuTXv4
         2/a8p4DSLWW7ThfJ1N/vnoit1PxtONlLohvp0qXVLMNOoONzEAi0W0M+Bz44RW33tSef
         Gjv/2nAj7xYPixYBGJ3Qv95efqPEgMvkzALEWxVXZj88j8gJxVlW+/1v+5M2fKZq2zjq
         /Z9A==
X-Gm-Message-State: AOJu0YxzWGrAzP6UjXvz3X8MLtVgPEzROX/0u+05aILYz0jCchmcYEjL
	PW4eAHKZZEeLlpnfvyT7t35tVuy8Kr8=
X-Google-Smtp-Source: AGHT+IGEbT8t4CZ3N4cgy9pqGA5czbLjGs1Gz8Y71mba2TNs49IXxRyxbyoU5833gCs2OEfg4ZOI+H5vNzY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d481:b0:1c1:3ba1:b635 with SMTP id
 c1-20020a170902d48100b001c13ba1b635mr117047plg.4.1695756671094; Tue, 26 Sep
 2023 12:31:11 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:31:09 -0700
In-Reply-To: <8e57c347d6c461431e84ef4354dc076f363f3c01.1695751312.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <8e57c347d6c461431e84ef4354dc076f363f3c01.1695751312.git.isaku.yamahata@intel.com>
Message-ID: <ZRMxfTd65Ijn3RAj@google.com>
Subject: Re: [PATCH] KVM: guest_memfd: Refactor kvm_gmem into inode->i_private
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 26, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Refactor guest_memfd to use inode->i_private to store info about kvm_gmem.

Why!?!?!?  Sadly, I don't have telepathic superpowers.  This changelog only
explains *what* the code is doing, what I need to know is *why* you want to make
this change.

The below kinda sorta suggests that this is to simplify the code, but it's not
at all obvious that that's the actual motivation, or the only motiviation.

> Currently it is stored in the following way.
> - flags in inode->i_private
> - struct kvm_gmem in file->private_data
> - struct kvm_gmem in linked linst in inode->i_mapping->private_list
>   And this list has single entry.
> 
> The relationship between struct file, struct inode and struct kvm_gmem is
> 1:1, not 1:many. 

No, it's not.  Or at least it won't be in the future.  As I explained before[1]:

 : The code is structured to allow for multiple gmem instances per inode.  This isn't
 : actually possible in the initial code base, but it's on the horizon[*].  I included
 : the list-based infrastructure in this initial series to ensure that guest_memfd
 : can actually support multiple files per inode, and to minimize the churn when the
 : "link" support comes along.

 : [*] https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com

[1] https://lore.kernel.org/all/ZQsAiGuw%2F38jIOV7@google.com
