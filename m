Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A072717C216
	for <linux-coco@lists.linux.dev>; Thu, 11 Jul 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720728499; cv=none; b=qjB2PhRYgKsb4DlZWS/HRGi7hw21U1kR5wkxsrcEPQwzwQkttvrROwbEDVsY9Lq8x7dCQts+B7laagZNDEYqQ94foTIXD1nQO1kZlBmN6lYYOaOPnyiGh5Fm/8ryN4/CqrShaoNnil5JxJDFdeZseQTyyMONtPOigflwLhkMLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720728499; c=relaxed/simple;
	bh=PIPcWl2CCifRuXxshHehTo5Do8qmkIKVdlPoP/OrbmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMq0nZtxDp7ouiVgZMEFO4R65/AnpdopUiKwpiYfFb+GDRT3VHJuKWNaF+c6bxBiQEAnLwMF5yMYLKHB+tCBl24Lrkjl3QkYJPxAxOQ0nAvGzg9OurLaYJa6BJi/f/+UFapZAI36hLg3+eUpoDh12wau3ran7thBrx8oYDBdqkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EK8dBtGk; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EK8dBtGk"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id S057sIhAPxIArS057smIeO; Thu, 11 Jul 2024 22:08:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720728489;
	bh=x71vc1uHNRWmKQBrU2DUPCSyE3jpac++ydkmAi7B0qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=EK8dBtGkRHsKpG/puprpm8hFYxgT2JlkAeGLHV+vQtLqpZ1WsLjDuyu/p/gcgdsHr
	 slQEvDmEKDYmLU1X6U/NvKiBqKnxkf7F37quYcvvXxB8/Q+uyyHxYMZVISmFE0fPno
	 FE9W7UFOi/n/81En2jAOxqTPH6iaDx/3uDWAMKDH3uZ0943BedhTBOp3meRg2NQcSA
	 tbh3HY6YxPchnRIy9boORukqYoGWPrm2UjPUo9aalz3R5IdgjtoAjim3h1ItxSdLBO
	 StPVD5Upix9mfzBOVSybvXls58wwmUt89QOgh+G8M+Qj2/uEa5z8CvZucZ94fCpNyZ
	 7kiQHdsz0hdOQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 11 Jul 2024 22:08:09 +0200
X-ME-IP: 90.11.132.44
Message-ID: <45f04f18-0f17-46a3-a8ba-21d1819e560a@wanadoo.fr>
Date: Thu, 11 Jul 2024 22:07:57 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] fs/configfs: Add a callback to determine
 attribute visibility
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Michael Roth
 <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <e555c8740a263fab9f83b2cbb44da1af49a2813c.1717600736.git.thomas.lendacky@amd.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <e555c8740a263fab9f83b2cbb44da1af49a2813c.1717600736.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/06/2024 à 17:18, Tom Lendacky a écrit :
> In order to support dynamic decisions as to whether an attribute should be
> created, add a callback that returns a bool to indicate whether the
> attribute should be displayed. If no callback is registered, the attribute
> is displayed by default.
> 
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>   fs/configfs/dir.c        | 10 ++++++++++
>   include/linux/configfs.h |  3 +++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
> index 18677cd4e62f..43d6bde1adcc 100644
> --- a/fs/configfs/dir.c
> +++ b/fs/configfs/dir.c
> @@ -580,6 +580,7 @@ static void detach_attrs(struct config_item * item)
>   static int populate_attrs(struct config_item *item)
>   {
>   	const struct config_item_type *t = item->ci_type;
> +	struct configfs_group_operations *ops;
>   	struct configfs_attribute *attr;
>   	struct configfs_bin_attribute *bin_attr;
>   	int error = 0;
> @@ -587,14 +588,23 @@ static int populate_attrs(struct config_item *item)
>   
>   	if (!t)
>   		return -EINVAL;
> +
> +	ops = t->ct_group_ops;
> +
>   	if (t->ct_attrs) {
>   		for (i = 0; (attr = t->ct_attrs[i]) != NULL; i++) {
> +			if (ops && ops->is_visible && !ops->is_visible(item, attr, i))
> +				continue;
> +
>   			if ((error = configfs_create_file(item, attr)))
>   				break;
>   		}
>   	}
>   	if (t->ct_bin_attrs) {
>   		for (i = 0; (bin_attr = t->ct_bin_attrs[i]) != NULL; i++) {
> +			if (ops && ops->is_bin_visible && !ops->is_bin_visible(item, bin_attr, i))
> +				continue;
> +
>   			error = configfs_create_bin_file(item, bin_attr);
>   			if (error)
>   				break;
> diff --git a/include/linux/configfs.h b/include/linux/configfs.h
> index 2606711adb18..c771e9d0d0b9 100644
> --- a/include/linux/configfs.h
> +++ b/include/linux/configfs.h
> @@ -216,6 +216,9 @@ struct configfs_group_operations {
>   	struct config_group *(*make_group)(struct config_group *group, const char *name);
>   	void (*disconnect_notify)(struct config_group *group, struct config_item *item);
>   	void (*drop_item)(struct config_group *group, struct config_item *item);
> +	bool (*is_visible)(struct config_item *item, struct configfs_attribute *attr, int n);
> +	bool (*is_bin_visible)(struct config_item *item, struct configfs_bin_attribute *attr,

Hi,

Should/could this take a *const* struct configfs_bin_attribute * and a 
const struct config_item *?

I'm currently looking if if is feasible to constify struct 
configfs_attribute and co.

In my investigation, I arrived on this new API.
So, if it makes sense to constify the attr argument, it would avoid some 
later work if.

Just my 2c

CJ



> +			       int n);
>   };
>   
>   struct configfs_subsystem {

